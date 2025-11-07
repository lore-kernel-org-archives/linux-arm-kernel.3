Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C30CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bo8hOLP5wIkBbrnuws1pinQ4AYj9Sz8IvZxz60kmJmU=; b=EIDRRuu0Heb1P4GemHi5FpI7vO
	UyRafiF7I+qGEBQm8tF3jPt+UsHFiu5zgV5zznPZLT+coB9haFTMDtdGx0y4V8Zctrf72fbAFcqY0
	059Ti3x1J3A9nKGqs3CmYFuLwFoG/3vmG8J/Qc3iRnBEJNUPjFy1MbyXCKbkb+34mqNJ1TSnJbey9
	WUJMB6mvO02z5qusdZbqGozzOfWRxDw8VWQuLa8Z1q415r3S0si714Jvnu4g1O9Lwt7En8iwaHbOu
	GPKhBCV+nR3TAQzmCWhkbL5S5U0OTFnnKwUfNAXFZg+X8sJepwR46nFys6mcmXv/W4iCct5KVUeG+
	VT4GaQog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOf4-000000000I8-3bm1;
	Fri, 07 Nov 2025 15:46:02 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOf2-000000000He-1kfn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 15:46:01 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b64cdbb949cso169359466b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 07:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762530358; x=1763135158; darn=lists.infradead.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bo8hOLP5wIkBbrnuws1pinQ4AYj9Sz8IvZxz60kmJmU=;
        b=Ojtca85ZVvkzPQpdx7PdcSD5M05IIkkgw0d5cMZl/WadIHtBLawSjEDFGZ7dY663lL
         zPlEFrdyp2Ha6EuplI0t/iKmEDsxVWdloK1f9AK0T5yd+zSaVnlPtDHOO3IDkR/Ue2Ag
         WoEaI5uHYbYwB//HXXheroreqf0eZLTncw212mB6zvp7+wUurAjOmL9m5JhTZFHAHWFs
         RUXwQ5e2Cf0FsNHnkPBfyEAoxhU2YNH9iqv62PsVAVDS1a8+8rtY8KcPJoIELSJugEfH
         gHj+9YZnJS0K4/P8J3nBBvMjPBYRspaQsG8CATbJTe2vQpcv6Fr5XetoGuWiCHSdcOW3
         7lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762530358; x=1763135158;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bo8hOLP5wIkBbrnuws1pinQ4AYj9Sz8IvZxz60kmJmU=;
        b=sSWfyMmcuEpFqCPeFdCfxdC17ydHsTssOSW2HkfwQvmqZ0XHXZR87CWJWFCRBYMqKU
         bTongFzUdL8Dc7IHkcQyT6Ywepz2CybPvy/61Yrc/YAbWMbcw4hKrpLl93e2R5OFi6tt
         kWuaE6U8eBxP0cL3+vLUJ4xDyXgaDEAqnUa831XDRThpXm9mo4fUxom2GhgbB7Fed8hG
         wie9dMA/sZrUSUHTo9R1oWGRiNxnPNpKwww3rRpxGrW0+Cg26FIaQW6H3d3k5FMfnE9+
         BHxl092nsVaZL6A/ImxpOTTAGXyrNkXwt+ficCerFZ7DgboKcSLQdzALfwXh2fabLXrI
         lE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfWL26eev24SNlr31yDK1B7gA/1MWYc2+qVFrVZU0UnxkOsvKKFjtn43ztSSyXKymd1DiJviIU1jut2CwRYnYH@lists.infradead.org
X-Gm-Message-State: AOJu0YzfgT+T3y/G/SQvfc1NJtwJxbcfBP7cRvmicoeglodhE75tX+R0
	0hnTgFLTZ94W3V/D9cqvohH3Vg2Pp8B3slYKmraY4njfTtEEpy/4Hty2UBCHMhDIY2c=
X-Gm-Gg: ASbGncuLEJIfSOvp3YIAf7L/mFQOMltX/ik3uVIz9QKVc6o8M5/o5+1NcMX6cdjaPG2
	2Hvejjx6zwibx+FLHTDZy+iZQpn7Ir8NajAiHlK0YDGAuGVrdbzKy/tK/qByJG/xktiPQVZj0Y5
	Exwz9T2KtQSecEzNwQ3s7kUuqfZFJkPG46Tm2pSbCB5nNnJ9WnomzBAi+Kyb93p1gfjE31BHShR
	0EqkPEFtTylRIvtuw/b6kK4SHBOKjOJS8ESi4xzfgKep5w4sovVrEBBkLea2/yo8LeOua0BZQ3p
	MOB8G0JZDHrT5AaWxz9OHSc2naChEulLilA911k7nzT86H6be82SutXMm6q/7oC4aUVVH1wsxmE
	+xA6Zzo5mqDrjWe8JMGw6XeSvcGw6EGLBs9aacOOGZPlaB55cV8LkFfiFeGnuSa1nlcER2Bhchb
	jALoBqZi40g6MSgM2YPYnWwgkpNzCj/diaPPrDeGVunfa+4AunKv7JE8IcYOVxhuHAUdzzRpqLJ
	fQbwQORBkAOGjGWCl6UsExJFW6psezU5t0GfZY=
X-Google-Smtp-Source: AGHT+IFuCx4lTV36ytxTOyAJ/RoowaLhIeY2jVZHeX87aG97vvwLOiA38P+znCtMJ8WqDnaM5A4vXg==
X-Received: by 2002:a17:907:6096:b0:b6d:4dc2:7be3 with SMTP id a640c23a62f3a-b72c08dc800mr387131266b.9.1762530357944;
        Fri, 07 Nov 2025 07:45:57 -0800 (PST)
Received: from ?IPV6:2003:e5:870e:1500:7795:3e8a:56c1:ae53? (p200300e5870e150077953e8a56c1ae53.dip0.t-ipconnect.de. [2003:e5:870e:1500:7795:3e8a:56c1:ae53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bdf15sm274044366b.62.2025.11.07.07.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 07:45:57 -0800 (PST)
Message-ID: <ed4971b3-49ea-4263-b225-80a643bca0c4@suse.com>
Date: Fri, 7 Nov 2025 16:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] x86/xen: simplify flush_lazy_mmu()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-3-kevin.brodsky@arm.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20251029100909.3381140-3-kevin.brodsky@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2KDMQGlJELWzw0JdPjGXTYgs"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_074600_526683_9F02C831 
X-CRM114-Status: GOOD (  11.59  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2KDMQGlJELWzw0JdPjGXTYgs
Content-Type: multipart/mixed; boundary="------------knysrRNvahQGLFPAzdME9JNX";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Message-ID: <ed4971b3-49ea-4263-b225-80a643bca0c4@suse.com>
Subject: Re: [PATCH v4 02/12] x86/xen: simplify flush_lazy_mmu()
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-3-kevin.brodsky@arm.com>
In-Reply-To: <20251029100909.3381140-3-kevin.brodsky@arm.com>

--------------knysrRNvahQGLFPAzdME9JNX
Content-Type: multipart/mixed; boundary="------------0xpsCIW0ItmLiouLur0gOGNm"

--------------0xpsCIW0ItmLiouLur0gOGNm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMTAuMjUgMTE6MDgsIEtldmluIEJyb2Rza3kgd3JvdGU6DQo+IGFyY2hfZmx1c2hf
bGF6eV9tbXVfbW9kZSgpIGlzIGNhbGxlZCB3aGVuIG91dHN0YW5kaW5nIGJhdGNoZWQNCj4g
cGd0YWJsZSBvcGVyYXRpb25zIG11c3QgYmUgY29tcGxldGVkIGltbWVkaWF0ZWx5LiBUaGVy
ZSBzaG91bGQNCj4gaG93ZXZlciBiZSBubyBuZWVkIHRvIGxlYXZlIGFuZCByZS1lbnRlciBs
YXp5IE1NVSBjb21wbGV0ZWx5LiBUaGUNCj4gb25seSBwYXJ0IG9mIHRoYXQgc2VxdWVuY2Ug
dGhhdCB3ZSByZWFsbHkgbmVlZCBpcyB4ZW5fbWNfZmx1c2goKTsNCj4gY2FsbCBpdCBkaXJl
Y3RseS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtldmluIEJyb2Rza3kgPGtldmluLmJyb2Rz
a3lAYXJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------0xpsCIW0ItmLiouLur0gOGNm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0xpsCIW0ItmLiouLur0gOGNm--

--------------knysrRNvahQGLFPAzdME9JNX--

--------------2KDMQGlJELWzw0JdPjGXTYgs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkOFDQFAwAAAAAACgkQsN6d1ii/Ey+9
7Qf/T56S47fDqEb7wrI6i48Xr9hbJbL1cOc88MTixDkHAfIu70HOLvfAW2G+G73cTTY/1IFY+cr+
wk6KhYqguuIbbFGh6hlD2neoBl0l4Fiujn0c9wTKQbJrDL6h8jDeODAFWmkuyd0Rtnawy6o+0tgP
OLmQ4vhbq2u58C6zzLGQWIz6csmJqnGTKYGIQZI/h7xUZhz/b/RzD8p5aTRMGfVraJlKwuNAsKmp
/f7DpPGGCI7nCZWglBlKRFiGM/bZFdt9rZRV30JAFzq5kyUL6Lp3Y0nGp91si4slpitgwPxEG3M6
oApGVoFTsieG0o5HaiDhf8c0R7g+2PiCjn5h6HxMIA==
=Eb3P
-----END PGP SIGNATURE-----

--------------2KDMQGlJELWzw0JdPjGXTYgs--

