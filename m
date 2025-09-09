Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED61CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 12:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XElcJECP7+8ySi8fl9eJbEz4NEzPyATGv+tov1ERLQ=; b=dgYDynej+RP2B8PoCJmJprvmEt
	si30ZICodKoT+y1gh+Bv+aEYy0MZEhuDlyqdl17z/o2sjsXiPrcsDET9J1RXVvlSzp4DGqDXpbxbW
	YI/2p5XsfWOagaBFKCM0Yk5v+8Bn88qeP5/QkZO9IlNTcoJ8sdk8D3xsiS8uih5eq68wmNg5+KrvL
	qdnDze5X4W4xOuj8i51y+GHd5odtLloCInHio90R1visS0jHRnnp2eXKpc3J9XAdpjFLkUmS8HELe
	fPuozGs9woogdKN8jp/vL9hTTz7BNvQrJbHGvBlURyu3kLs+xFMK+QvbrYl3WxPmxj4O8NBiLs7JY
	az0li7rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvx7H-00000006xL4-00MI;
	Tue, 09 Sep 2025 12:06:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvunC-0000000627U-2KSC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:37:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45b9853e630so50011965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 02:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757410656; x=1758015456; darn=lists.infradead.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4XElcJECP7+8ySi8fl9eJbEz4NEzPyATGv+tov1ERLQ=;
        b=e0JVqQcGnZdpp7LqBBWi4cUsafXavMv0GtdoI2SOZWuUvbCwCK09i2s/fB8TaMZ58p
         WjlEFGj2vRT/qH5qoJYg1cXzc/TvYjDgIH2ek/xa092oBVCP3KAfwPIDTmwYpUggH1Rn
         1a6TZCqRnxNI7IYAMsXopQ+K+AjzgsabYgSIZd/lGZdyijBmUTV8SF80T+FpOJNFvzQM
         yQ2dmll3VpUGTzRr44HHBSMRlIh55nXWvOqLrTk0Q9JDyRTN4M358+7ba7NOYJjVXaiW
         tNXdKBjF7PWE0YXPUYURe9+d1TlVzTFl1xj7C/hshFcOSUDomWcxR23BZYhFtHl/jJvY
         S7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757410656; x=1758015456;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4XElcJECP7+8ySi8fl9eJbEz4NEzPyATGv+tov1ERLQ=;
        b=iLJw2CFsF2GcPy/kYSfyqHUOH6Mt2oredpwLP6Z8l20OaBtwUsgwa83DAV3vxHiosc
         HnNFDJFd7Z6SmnU3pz5WxEnYi558wGy/k1+ZdUANJwYJArenwKoE2ouPb5MCWUw1SGCJ
         UDgD3vOdqgqMnhhgq6v4NSSobfXJ0QyLUbGLT4yTGFWkgnfqrohLF4xtI6q2aMmOoeHk
         bSngbEZIXRPzrnmFGxsJ9fd0T+BwQjvwy4Lx/dTIFZDEmnXLnsZNbVYaVZdePOzUldRe
         HXd3XTWiD+A9bujEAOLNyFOrMtB4mD3lbY1COoYk7ozKoAbPGa9CYs82uBi3v6aROVqf
         bQgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGa8+9+JWFlyfbF9Lbeuf0BmXPbY9SuSn1VweNCs0fJ8lMSvUDKfACIMvu61sFwCYMZdJEIu28n8KTwyM37ek8@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr6NarPsHjqj9alMj22ZiB766bYmn7OUYdo6CZpjEqhvFYn6tQ
	3jt8xpsU2JxuJVFcod7TnOf3sL6CG8/762rB42vWrmvhWbn7R7T6PtDdK2ClCF4MQgQ=
X-Gm-Gg: ASbGncvSFinYfEIYv0eHjEC+bC/XKX5+pkcxArdeyh+EI7tBK249mCcPPN/11IvQ3VM
	0Ng8O4c2olxOgldeRSF83HH2acybEXdRedmJ3uA3k1vulVheOHBQKjwk95dj+h2Xmk0e62OPILH
	xj1BE16cfeSw9bkbtJHe0z5WAl6o/HxHsRNfjR+zMFm03eiRen1qtciQZuu2AumXe+Ej3Z+kHLy
	S+Lg99Vy3+DABJ3APWj/TI++BfKrzqW3pMHc4XZzknSa4c/5A9YCTDRpAxLE0dCMb657t229igw
	xKYd7BR//0KNmqmYmvWP27xgNomQT31HfrSaaJJ6/muE8EdrFBQVUBnTPEKJtwG8z6dnTQ/BxYz
	dn9RY7kWuLln528MaE64Xzo/8hqXAqmdRPypekqedB0ElYHky6dN2IjC3Qq58fStYfDFC7eeGpO
	HJYujhqm7gmS9ZARj7qVypvGFF7cP0QlajphXevjU3q7PN
X-Google-Smtp-Source: AGHT+IHwqTpyjN6Kpfprj3lvyaI65S9KlfYJXUJjVo+3/81P0K/21tdQcXIRqnFGfxS9vPLVolXDMQ==
X-Received: by 2002:a05:600c:1c9d:b0:45d:e135:6bb2 with SMTP id 5b1f17b1804b1-45de1356cc4mr75349405e9.21.1757410656405;
        Tue, 09 Sep 2025 02:37:36 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:be00:c26:b971:1ba7:9d8b? (p200300e5873dbe000c26b9711ba79d8b.dip0.t-ipconnect.de. [2003:e5:873d:be00:c26:b971:1ba7:9d8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45de16b8b58sm129214985e9.4.2025.09.09.02.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 02:37:36 -0700 (PDT)
Message-ID: <360712fa-f7a0-4674-acc4-76f79141fe4f@suse.com>
Date: Tue, 9 Sep 2025 11:37:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] x86/xen: support nested lazy_mmu sections (again)
To: David Hildenbrand <david@redhat.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-5-kevin.brodsky@arm.com>
 <aa28c1a7-82fc-42af-9904-a4d4db078a19@redhat.com>
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
In-Reply-To: <aa28c1a7-82fc-42af-9904-a4d4db078a19@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BeYvUArs7t07H8bFnKjaf7a6"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_023738_615724_0E7E116F 
X-CRM114-Status: GOOD (  24.33  )
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
--------------BeYvUArs7t07H8bFnKjaf7a6
Content-Type: multipart/mixed; boundary="------------N21H8u063pzOozrNPbZG8YaJ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: David Hildenbrand <david@redhat.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Message-ID: <360712fa-f7a0-4674-acc4-76f79141fe4f@suse.com>
Subject: Re: [PATCH v2 4/7] x86/xen: support nested lazy_mmu sections (again)
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-5-kevin.brodsky@arm.com>
 <aa28c1a7-82fc-42af-9904-a4d4db078a19@redhat.com>
In-Reply-To: <aa28c1a7-82fc-42af-9904-a4d4db078a19@redhat.com>

--------------N21H8u063pzOozrNPbZG8YaJ
Content-Type: multipart/mixed; boundary="------------ku0itVfiK1E3s3Do8zg7Z645"

--------------ku0itVfiK1E3s3Do8zg7Z645
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDkuMjUgMTE6MTMsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOg0KPiBPbiAwOC4w
OS4yNSAwOTozOSwgS2V2aW4gQnJvZHNreSB3cm90ZToNCj4+IENvbW1pdCA0OTE0N2JlYjBj
Y2IgKCJ4ODYveGVuOiBhbGxvdyBuZXN0aW5nIG9mIHNhbWUgbGF6eSBtb2RlIikNCj4+IG9y
aWdpbmFsbHkgaW50cm9kdWNlZCBzdXBwb3J0IGZvciBuZXN0ZWQgbGF6eSBzZWN0aW9ucyAo
TEFaWV9NTVUgYW5kDQo+PiBMQVpZX0NQVSkuIEl0IGxhdGVyIGdvdCByZXZlcnRlZCBieSBj
b21taXQgYzM2NTQ5ZmY4ZDg0IGFzIGl0cw0KPj4gaW1wbGVtZW50YXRpb24gdHVybmVkIG91
dCB0byBiZSBpbnRvbGVyYW50IHRvIHByZWVtcHRpb24uDQo+Pg0KPj4gTm93IHRoYXQgdGhl
IGxhenlfbW11IEFQSSBhbGxvd3MgZW50ZXIoKSB0byBwYXNzIHRocm91Z2ggYSBzdGF0ZSB0
bw0KPj4gdGhlIG1hdGNoaW5nIGxlYXZlKCkgY2FsbCwgd2UgY2FuIHN1cHBvcnQgbmVzdGlu
ZyBhZ2FpbiBmb3IgdGhlDQo+PiBMQVpZX01NVSBtb2RlIGluIGEgcHJlZW1wdGlvbi1zYWZl
IG1hbm5lci4gSWYgeGVuX2VudGVyX2xhenlfbW11KCkgaXMNCj4+IGNhbGxlZCBpbnNpZGUg
YW4gYWN0aXZlIGxhenlfbW11IHNlY3Rpb24sIHhlbl9sYXp5X21vZGUgd2lsbCBhbHJlYWR5
DQo+PiBiZSBzZXQgdG8gWEVOX0xBWllfTU1VIGFuZCB3ZSBjYW4gdGhlbiByZXR1cm4gTEFa
WV9NTVVfTkVTVEVEIHRvDQo+PiBpbnN0cnVjdCB0aGUgbWF0Y2hpbmcgeGVuX2xlYXZlX2xh
enlfbW11KCkgY2FsbCB0byBsZWF2ZQ0KPj4geGVuX2xhenlfbW9kZSB1bmNoYW5nZWQuDQo+
Pg0KPj4gVGhlIG9ubHkgZWZmZWN0IG9mIHRoaXMgcGF0Y2ggaXMgdG8gZW5zdXJlIHRoYXQg
eGVuX2xhenlfbW9kZQ0KPj4gcmVtYWlucyBzZXQgdG8gWEVOX0xBWllfTU1VIHVudGlsIHRo
ZSBvdXRlcm1vc3QgbGF6eV9tbXUgc2VjdGlvbg0KPj4gZW5kcy4geGVuX2xlYXZlX2xhenlf
bW11KCkgc3RpbGwgY2FsbHMgeGVuX21jX2ZsdXNoKCkNCj4+IHVuY29uZGl0aW9uYWxseS4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBCcm9kc2t5IDxrZXZpbi5icm9kc2t5QGFy
bS5jb20+DQo+PiAtLS0NCj4+IMKgIGFyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmjC
oMKgwqDCoMKgwqAgfMKgIDYgKystLS0tDQo+PiDCoCBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9w
YXJhdmlydF90eXBlcy5oIHzCoCA0ICsrLS0NCj4+IMKgIGFyY2gveDg2L3hlbi9tbXVfcHYu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTEgKysrKysrKystLS0NCj4+
IMKgIDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQuaCBi
L2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmgNCj4+IGluZGV4IDY1YTBkMzk0ZmJh
MS4uNGVjZDNhNmIxZGVhIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20v
cGFyYXZpcnQuaA0KPj4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQuaA0K
Pj4gQEAgLTUyOSwxNCArNTI5LDEyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX2VuZF9j
b250ZXh0X3N3aXRjaChzdHJ1Y3QgDQo+PiB0YXNrX3N0cnVjdCAqbmV4dCkNCj4+IMKgICNk
ZWZpbmXCoCBfX0hBVkVfQVJDSF9FTlRFUl9MQVpZX01NVV9NT0RFDQo+PiDCoCBzdGF0aWMg
aW5saW5lIGxhenlfbW11X3N0YXRlX3QgYXJjaF9lbnRlcl9sYXp5X21tdV9tb2RlKHZvaWQp
DQo+PiDCoCB7DQo+PiAtwqDCoMKgIFBWT1BfVkNBTEwwKG1tdS5sYXp5X21vZGUuZW50ZXIp
Ow0KPj4gLQ0KPj4gLcKgwqDCoCByZXR1cm4gTEFaWV9NTVVfREVGQVVMVDsNCj4+ICvCoMKg
wqAgcmV0dXJuIFBWT1BfQ0FMTDAobGF6eV9tbXVfc3RhdGVfdCwgbW11LmxhenlfbW9kZS5l
bnRlcik7DQo+PiDCoCB9DQo+PiDCoCBzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF9sZWF2ZV9s
YXp5X21tdV9tb2RlKGxhenlfbW11X3N0YXRlX3Qgc3RhdGUpDQo+PiDCoCB7DQo+PiAtwqDC
oMKgIFBWT1BfVkNBTEwwKG1tdS5sYXp5X21vZGUubGVhdmUpOw0KPj4gK8KgwqDCoCBQVk9Q
X1ZDQUxMMShtbXUubGF6eV9tb2RlLmxlYXZlLCBzdGF0ZSk7DQo+PiDCoCB9DQo+PiDCoCBz
dGF0aWMgaW5saW5lIHZvaWQgYXJjaF9mbHVzaF9sYXp5X21tdV9tb2RlKHZvaWQpDQo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnRfdHlwZXMuaCBiL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtLyANCj4+IHBhcmF2aXJ0X3R5cGVzLmgNCj4+IGluZGV4IGJj
MWFmODY4NjhhMy4uYjdjNTY3Y2NiZjMyIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC94ODYvaW5j
bHVkZS9hc20vcGFyYXZpcnRfdHlwZXMuaA0KPj4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS9h
c20vcGFyYXZpcnRfdHlwZXMuaA0KPj4gQEAgLTQ1LDggKzQ1LDggQEAgdHlwZWRlZiBpbnQg
bGF6eV9tbXVfc3RhdGVfdDsNCj4+IMKgIHN0cnVjdCBwdl9sYXp5X29wcyB7DQo+PiDCoMKg
wqDCoMKgIC8qIFNldCBkZWZlcnJlZCB1cGRhdGUgbW9kZSwgdXNlZCBmb3IgYmF0Y2hpbmcg
b3BlcmF0aW9ucy4gKi8NCj4+IC3CoMKgwqAgdm9pZCAoKmVudGVyKSh2b2lkKTsNCj4+IC3C
oMKgwqAgdm9pZCAoKmxlYXZlKSh2b2lkKTsNCj4+ICvCoMKgwqAgbGF6eV9tbXVfc3RhdGVf
dCAoKmVudGVyKSh2b2lkKTsNCj4+ICvCoMKgwqAgdm9pZCAoKmxlYXZlKShsYXp5X21tdV9z
dGF0ZV90KTsNCj4+IMKgwqDCoMKgwqAgdm9pZCAoKmZsdXNoKSh2b2lkKTsNCj4+IMKgIH0g
X19ub19yYW5kb21pemVfbGF5b3V0Ow0KPj4gwqAgI2VuZGlmDQo+PiBkaWZmIC0tZ2l0IGEv
YXJjaC94ODYveGVuL21tdV9wdi5jIGIvYXJjaC94ODYveGVuL21tdV9wdi5jDQo+PiBpbmRl
eCAyMDM5ZDUxMzJjYTMuLjZlNTM5MGZmMDZhNSAxMDA2NDQNCj4+IC0tLSBhL2FyY2gveDg2
L3hlbi9tbXVfcHYuYw0KPj4gKysrIGIvYXJjaC94ODYveGVuL21tdV9wdi5jDQo+PiBAQCAt
MjEzMCw5ICsyMTMwLDEzIEBAIHN0YXRpYyB2b2lkIHhlbl9zZXRfZml4bWFwKHVuc2lnbmVk
IGlkeCwgcGh5c19hZGRyX3QgDQo+PiBwaHlzLCBwZ3Byb3RfdCBwcm90KQ0KPj4gwqAgI2Vu
ZGlmDQo+PiDCoCB9DQo+PiAtc3RhdGljIHZvaWQgeGVuX2VudGVyX2xhenlfbW11KHZvaWQp
DQo+PiArc3RhdGljIGxhenlfbW11X3N0YXRlX3QgeGVuX2VudGVyX2xhenlfbW11KHZvaWQp
DQo+PiDCoCB7DQo+PiArwqDCoMKgIGlmICh0aGlzX2NwdV9yZWFkKHhlbl9sYXp5X21vZGUp
ID09IFhFTl9MQVpZX01NVSkNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gTEFaWV9NTVVf
TkVTVEVEOw0KPj4gKw0KPiANCj4gWW91IG1lbnRpb24gYWJvdmUgInByZWVtcHRpb24tc2Fm
ZSBtYW5uZXIiIGFib3ZlLCBzbyBJIGFtIHdvbmRlcmluZywNCj4gd2hhdCBpZiB3ZSBnZXQg
cHJlZW1wdGVkIGltbWVkaWF0ZWx5IGFmdGVyIGRvaW5nIHRoZSB0aGlzX2NwdV9yZWFkKCkg
YW5kIGdldCANCj4gc2NoZWR1bGVkIG9uIGFub3RoZXIgQ1BVPw0KPiANCg0KVGhpcyBzaG91
bGQgc3RpbGwgYmUgY29ycmVjdDogcHJlZW1wdGlvbiBuZWVkcyBhIGNvbnRleHQgc3dpdGNo
IHRvIGhhcHBlbiwNCnNvIHhlbl9zdGFydF9jb250ZXh0X3N3aXRjaCgpIGFuZCB4ZW5fZW5k
X2NvbnRleHRfc3dpdGNoKCkgYXJlIGludm9sdmVkLg0KVGhvc2UgYXJlIGRlYWxpbmcgd2l0
aCB0aGlzIHByb2JsZW0gYnkgZG9pbmcgdGhlIHJpZ2h0IHRoaW5nIGluIHRoZSBvbGQNCmFu
ZCB0aGUgbmV3IGNvbnRleHQuDQoNCg0KSnVlcmdlbg0K
--------------ku0itVfiK1E3s3Do8zg7Z645
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ku0itVfiK1E3s3Do8zg7Z645--

--------------N21H8u063pzOozrNPbZG8YaJ--

--------------BeYvUArs7t07H8bFnKjaf7a6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmi/9V4FAwAAAAAACgkQsN6d1ii/Ey+F
eAf+JATQ71kRnWaomTj1xL+hfmy+uZt/wVyu3xYTMbJ9EWKIHTJr/D1HsJgdDwE2A5eGGzTSCd5X
PY69tcvWQHLYqi689FgEbCGN2InjvaAtQncZecnR47pyIeYp5IctlX9bkH2BeRw5LrV22rRdLwXn
gBiHVv8Hc7Q0U5MdAfWlYld7f60jjKOL7nrkPnuycfxdXE6LRoKXvavgkczfj3OUfxLpJKN2eUNz
De7Ot1NAH2KSq5mx7560580j0QE1cyJwru6S14unms+MyjlcBxiNtEeRRskOwuPAJ4m8c7CapmbD
/rYnIaeNCRqVGx0NPnojTaMCE+tMExv1H15wHlWA3w==
=5cPm
-----END PGP SIGNATURE-----

--------------BeYvUArs7t07H8bFnKjaf7a6--

