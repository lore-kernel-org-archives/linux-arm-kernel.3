Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA0EEDEC1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 07:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMy+xY/ZILycop2OT/VSerM81rFoidozVQH5CwTmWu4=; b=2fr86FKk/l6m1JWj3kGE55Z3B8
	eZjQpptA3EdzjjXf8NEpD7d/LBXdSA/+SHLcHadlUVuEbL+2aUW0g5SrdUFOOcBFam9/5co3YJM8Y
	kLO//g6gOzpEtCv3qrq04aC0LvNPPD0Ci/lIwsmFZDyN4gQV1DBB82nQedrGOUQurCUkzn75DlCXn
	sGzuJ2OaUGNUAo4mFaxf9XBayPFhFnQVTm2SRNyNv4TAJxhMVxCJzWQzevS/HSFq0N8YM7KrOB+2F
	Jgu1vE1iaXgomlY+qbEFvC5/OSjH50yf56M+kDCsWqOQvZ6CwbDIqLiLE1k9tFNxrLUnb82MBF7Of
	mB7ImfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxh2H-0000000GflY-153A;
	Wed, 04 Mar 2026 07:52:49 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxh2E-0000000Gfkv-361c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 07:52:48 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b9373af81cdso27037066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 23:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772610764; x=1773215564; darn=lists.infradead.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pMy+xY/ZILycop2OT/VSerM81rFoidozVQH5CwTmWu4=;
        b=JKgCl/BBTXZ/oMXGpUqMYnFS5sXW8UJC1VcEJfbBW5wttdwbMiXlhbNSadKPfgoiwj
         0INQyhbKfn9KB1HfpoY9tCo4S5nduiq+J7rrsZD8j0wq5vPDqT48MrG/w7R/Lb57HNJC
         eCjesvBmuW7yE0C1/eAk2bFccf6wYDwOhnR2Uthu/LizNStIymV7YTU88ePZhVGuiomf
         WX/w1I9NhZ8Dicy6Fnk4Pci6e2+NRTgGKSxKwUkvY/yPFWjZf2mzttdeyiJPFW/paPjK
         8xGfbYpXe6JCu1ucilwSbFiQ7Pp6GGTM3BrISAIs4zrn6V3C9x1dKV+K9UAKRtE1YgPQ
         0eCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772610764; x=1773215564;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMy+xY/ZILycop2OT/VSerM81rFoidozVQH5CwTmWu4=;
        b=BXsezh9yul16j3FNk5gmScpud6DPNna4ryItqe1qhRJw7/qfg0mUioSAWEt4CigMfQ
         h01GgEBj+7h3x7TSi2r8Qp0/UwosDD9JAZ4Uv60I+WoZU0PPQ/N/6AxMZzeehTNLpikb
         bSv7N0+iR6zqnrq4vDUDwVe9iWt21sj0k6rmCoBmuS8Zy+XMxsG1q7HVjLtIVqIuPPXI
         iQPFdC0fRic6EJNRPqNEXgN1bgstUMxjVHGCGr9ktE/rBUpD43fCf5iIPuMGMenzacNz
         iRO+7p2UqEIwIelKESwmm8zzokQmDF3NAS0PLCKY2DftP69U+3O9QY6k9jO/RN7ZJ7VU
         ibKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjwHnDltGzayLcbiPpGfTbo4dM928gGsOe3Rzl9NecFdliZGmwOrdw7Lw4aZ+eu59xHeGlrAjhOgDsO6HWrmuh@lists.infradead.org
X-Gm-Message-State: AOJu0YzrqtU1rjhYWK5cUPHGVJeh0FQXAPwVmJHAyIOv7aa1NXNwmPga
	ekLfvZ3alCfA7ijyRYhZfXzuIqFnI67qXxIelLAqKFhimoC7/VDNoY2FYRlFHWM5Ils=
X-Gm-Gg: ATEYQzwQ1ma4HQf5vO2obwq7Q6M3c5a9QodBq2LSLL3metmo9ipUu//XsxY23cOnPdw
	D+RhBSYCcCUzmfxYA1FSCARVWSzp4hjUkdgYYtRDBs9/7L9yeMHQM/wlBwhuFnECEJVfAXUgPZs
	uK8JNs2kwEa6oXCKbt8e0IheMjsBBZZB478lx0C+SB5gDKU8+2z1J+5XPyoC05j9+u4huFiKb3V
	bRr47lGVAH9nQ2xgkoc+DT3HNLavemqLG0qeadLsNVDCEPV3DszDnT8hRrNMsp6sqFd4N34t501
	HxNmcuZjD4v9ZlU7monIT87OvnCLgqoGKasm645Uhtws0oPjdOW9u9+acUECu+KkOcbi4FJEj3c
	wS1yS92vctqldHaO1wx/F4lTysoABvX8eDLrWpPN1j+d+g9fKmvrs5rCPFXUdLZs8BSXjYSCi1X
	Mv5XyeU0R6d+7bRLPUYvBqSrOdYGt7P8rdmqlzmt6oOYD8FwvbDX7bH8yPaeaelz4bL6wbHqBPv
	JspZ4Zm/ktjq630DtDO0BMsRCBeFQ36zAC9ISsUXOAY1E//Ajy2zQ==
X-Received: by 2002:a17:907:6d24:b0:b8f:dce0:dbab with SMTP id a640c23a62f3a-b93f115f92fmr52828466b.3.1772610764049;
        Tue, 03 Mar 2026 23:52:44 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66005566561sm3847816a12.30.2026.03.03.23.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 23:52:43 -0800 (PST)
Message-ID: <5eaf3846-01db-471e-9903-b0b239d7838d@suse.com>
Date: Wed, 4 Mar 2026 08:52:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 2/4] mm/pgtable: Make pfn_pte() filter out huge
 page attributes
To: Yin Tirui <yintirui@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 willy@infradead.org, david@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, anshuman.khandual@arm.com,
 rmclure@linux.ibm.com, kevin.brodsky@arm.com, apopple@nvidia.com,
 ajd@linux.ibm.com, pasha.tatashin@soleen.com, bhe@redhat.com,
 thuth@redhat.com, coxu@redhat.com, dan.j.williams@intel.com,
 yu-cheng.yu@intel.com, yangyicong@hisilicon.com, baolu.lu@linux.intel.com,
 conor.dooley@microchip.com, Jonathan.Cameron@huawei.com, riel@surriel.com
Cc: wangkefeng.wang@huawei.com, chenjun102@huawei.com
References: <20260228070906.1418911-1-yintirui@huawei.com>
 <20260228070906.1418911-3-yintirui@huawei.com>
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
In-Reply-To: <20260228070906.1418911-3-yintirui@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4Q0Un8DPj4QMr7heEW0xqaMn"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_235246_857240_24F1C650 
X-CRM114-Status: GOOD (  21.20  )
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
--------------4Q0Un8DPj4QMr7heEW0xqaMn
Content-Type: multipart/mixed; boundary="------------eHH2OwI0Kt0JiluSSIvahl6m";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Yin Tirui <yintirui@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 willy@infradead.org, david@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, anshuman.khandual@arm.com,
 rmclure@linux.ibm.com, kevin.brodsky@arm.com, apopple@nvidia.com,
 ajd@linux.ibm.com, pasha.tatashin@soleen.com, bhe@redhat.com,
 thuth@redhat.com, coxu@redhat.com, dan.j.williams@intel.com,
 yu-cheng.yu@intel.com, yangyicong@hisilicon.com, baolu.lu@linux.intel.com,
 conor.dooley@microchip.com, Jonathan.Cameron@huawei.com, riel@surriel.com
Cc: wangkefeng.wang@huawei.com, chenjun102@huawei.com
Message-ID: <5eaf3846-01db-471e-9903-b0b239d7838d@suse.com>
Subject: Re: [PATCH RFC v3 2/4] mm/pgtable: Make pfn_pte() filter out huge
 page attributes
References: <20260228070906.1418911-1-yintirui@huawei.com>
 <20260228070906.1418911-3-yintirui@huawei.com>
In-Reply-To: <20260228070906.1418911-3-yintirui@huawei.com>

--------------eHH2OwI0Kt0JiluSSIvahl6m
Content-Type: multipart/mixed; boundary="------------0BzEchG0Fv1uwwoBbITJlic6"

--------------0BzEchG0Fv1uwwoBbITJlic6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDIuMjYgMDg6MDksIFlpbiBUaXJ1aSB3cm90ZToNCj4gQSBmdW5kYW1lbnRhbCBw
cmluY2lwbGUgb2YgcGFnZSB0YWJsZSB0eXBlIHNhZmV0eSBpcyB0aGF0IGBwdGVfdGAgcmVw
cmVzZW50cw0KPiB0aGUgbG93ZXN0IGxldmVsIHBhZ2UgdGFibGUgZW50cnkgYW5kIHNob3Vs
ZCBuZXZlciBjYXJyeSBodWdlIHBhZ2UgYXR0cmlidXRlcy4NCj4gDQo+IEN1cnJlbnRseSwg
cGFzc2luZyBhIHBncHJvdCB3aXRoIGh1Z2UgcGFnZSBiaXRzIChlLmcuLCBleHRyYWN0ZWQg
dmlhDQo+IHBtZF9wZ3Byb3QoKSkgaW50byBwZm5fcHRlKCkgY3JlYXRlcyBhIG1hbGZvcm1l
ZCBQVEUgdGhhdCByZXRhaW5zIHRoZSBodWdlDQo+IGF0dHJpYnV0ZSwgbGVhZGluZyB0byB0
aGUgbmVjZXNzaXR5IG9mIHRoZSB1Z2x5IGBwdGVfY2xyaHVnZSgpYCBhbnRpLXBhdHRlcm4u
DQo+IA0KPiBFbmZvcmNlIHR5cGUgc2FmZXR5IGJ5IG1ha2luZyBgcGZuX3B0ZSgpYCBpbmhl
cmVudGx5IGZpbHRlciBvdXQgaHVnZSBwYWdlDQo+IGF0dHJpYnV0ZXM6DQo+IC0gT24geDg2
OiBTdHJpcCB0aGUgYF9QQUdFX1BTRWAgYml0Lg0KPiAtIE9uIEFSTTY0OiBNYXNrIG91dCB0
aGUgYmxvY2sgZGVzY3JpcHRvciBiaXRzIGluIGBQVEVfVFlQRV9NQVNLYCBhbmQNCj4gICAg
ZW5mb3JjZSB0aGUgYFBURV9UWVBFX1BBR0VgIGZvcm1hdC4NCj4gLSBPbiBSSVNDLVY6IE5v
IGNoYW5nZXMgcmVxdWlyZWQsIGFzIFJJU0MtViBsZWFmIFBNRHMgYW5kIFBURXMgc2hhcmUg
dGhlDQo+ICAgIGV4YWN0IHNhbWUgaGFyZHdhcmUgZm9ybWF0IGFuZCBkbyBub3QgdXNlIGEg
ZGlzdGluY3QgaHVnZSBiaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBZaW4gVGlydWkgPHlp
bnRpcnVpQGh1YXdlaS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20v
cGd0YWJsZS5oIHwgNCArKystDQo+ICAgYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5o
ICAgfCA0ICsrKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
cGd0YWJsZS5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gaW5kZXgg
YjNlNTg3MzVjNDliLi5mMmE3YTQwMTA2ZDIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQv
aW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
cGd0YWJsZS5oDQo+IEBAIC0xNDEsNyArMTQxLDkgQEAgc3RhdGljIGlubGluZSBwdGV2YWxf
dCBfX3BoeXNfdG9fcHRlX3ZhbChwaHlzX2FkZHJfdCBwaHlzKQ0KPiAgIA0KPiAgICNkZWZp
bmUgcHRlX3BmbihwdGUpCQkoX19wdGVfdG9fcGh5cyhwdGUpID4+IFBBR0VfU0hJRlQpDQo+
ICAgI2RlZmluZSBwZm5fcHRlKHBmbixwcm90KQlcDQo+IC0JX19wdGUoX19waHlzX3RvX3B0
ZV92YWwoKHBoeXNfYWRkcl90KShwZm4pIDw8IFBBR0VfU0hJRlQpIHwgcGdwcm90X3ZhbChw
cm90KSkNCj4gKwlfX3B0ZShfX3BoeXNfdG9fcHRlX3ZhbCgocGh5c19hZGRyX3QpKHBmbikg
PDwgUEFHRV9TSElGVCkgfCBcDQo+ICsJCSgocGdwcm90X3ZhbChwcm90KSAmIH4oUFRFX1RZ
UEVfTUFTSyAmIH5QVEVfVkFMSUQpKSB8IFwNCj4gKwkJKFBURV9UWVBFX1BBR0UgJiB+UFRF
X1ZBTElEKSkpDQo+ICAgDQo+ICAgI2RlZmluZSBwdGVfbm9uZShwdGUpCQkoIXB0ZV92YWwo
cHRlKSkNCj4gICAjZGVmaW5lIHB0ZV9wYWdlKHB0ZSkJCShwZm5fdG9fcGFnZShwdGVfcGZu
KHB0ZSkpKQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5o
IGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IGluZGV4IDE2NjJjNWE4ZjQ0
NS4uYTRkYmQ4MWQ0MmJmIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmgNCj4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IEBA
IC03MzgsNiArNzM4LDEwIEBAIHN0YXRpYyBpbmxpbmUgcGdwcm90dmFsX3QgY2hlY2tfcGdw
cm90KHBncHJvdF90IHBncHJvdCkNCj4gICBzdGF0aWMgaW5saW5lIHB0ZV90IHBmbl9wdGUo
dW5zaWduZWQgbG9uZyBwYWdlX25yLCBwZ3Byb3RfdCBwZ3Byb3QpDQo+ICAgew0KPiAgIAlw
aHlzX2FkZHJfdCBwZm4gPSAocGh5c19hZGRyX3QpcGFnZV9uciA8PCBQQUdFX1NISUZUOw0K
PiArDQo+ICsJLyogRmlsdGVyIG91dCBfUEFHRV9QU0UgdG8gZW5zdXJlIFBURXMgbmV2ZXIg
Y2FycnkgdGhlIGh1Z2UgcGFnZSBiaXQgKi8NCj4gKwlwZ3Byb3QgPSBfX3BncHJvdChwZ3By
b3RfdmFsKHBncHJvdCkgJiB+X1BBR0VfUFNFKTsNCg0KSXMgaXQgcmVhbGx5IGEgZ29vZCBp
ZGVhIHRvIHNpbGVudGx5IGRyb3AgdGhlIGJpdD8NCg0KVG9kYXkgaXQgY2FuIGVpdGhlciBi
ZSB1c2VkIGZvciBhIGxhcmdlIHBhZ2UgKHdoaWNoIHNob3VsZCBiZSBhIHBtZCwNCm9mIGNv
dXJzZSksIG9yIC0gbXVjaCB3b3JzZSAtIHlvdSdkIHN0cmlwIHRoZSBfUEFHRV9QQVQgYml0
LCB3aGljaCBpcw0KYXQgdGhlIHNhbWUgcG9zaXRpb24gaW4gUFRFcy4NCg0KU28gYmFzaWNh
bGx5IHlvdSBhcmUgcmVtb3ZpbmcgdGhlIGFiaWxpdHkgdG8gdXNlIHNvbWUgY2FjaGUgbW9k
ZXMuDQoNCk5BQ0shDQoNCg0KSnVlcmdlbg0K
--------------0BzEchG0Fv1uwwoBbITJlic6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0BzEchG0Fv1uwwoBbITJlic6--

--------------eHH2OwI0Kt0JiluSSIvahl6m--

--------------4Q0Un8DPj4QMr7heEW0xqaMn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmn5MoFAwAAAAAACgkQsN6d1ii/Ey/k
vQf/fE88g2PmSmmcymJCof0xcwP8bE+3iRk0Miiln2sY9txLEAR6MHu6+/HTkcOVh2Q1J617wE06
fc+UHW6tF3EPK7Kah8k/ofB1sim1xcUpNpdrLXA6DynByi+C065QijdwxXW2BFOWCMW89O7U/E5W
b3jnDodekM1oo7evELNkqgN4vhlHV4eNfGfLpfu59yBUF0QgphJVwlMbQ5RtpZ7/qxIKsM6Oq0bx
BiqrCRH7X2ZJY1NPIzLlWPHK/864HLnt/LB0aKNzsfqbDPs81Hs4W/VVfICMkMvqy3ii8tsoHsRJ
21QRf7kQkoLZMU1Knp0s/WMUnpE5Xo20IgEJF+NCGg==
=7c4C
-----END PGP SIGNATURE-----

--------------4Q0Un8DPj4QMr7heEW0xqaMn--

