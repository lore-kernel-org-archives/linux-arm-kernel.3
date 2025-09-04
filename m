Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF660CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnB78AZRybzXGEGbKEs063u7SIqqC/HQB9Q8uYop7u0=; b=ngkqjs0+eHwUHCNudfUDcwFy58
	POScFwedAM6p97hcfzoQpOB43SkxiGDSkVWY38Xk6nug8rcYmagenRtxnwpvL4L1yQS6GOPoWuRyg
	DCOxv93BRWtAy907FY7TNxZ1B/L72LACQCKCstqZ69lbEHvfTGXs1wNMEsDBaOpWaiWtTEm1lOkbA
	c+JfKJ5qfxHC7XJ3x4aihWnv3XG8aJojSaD1GKO87lw83Pl/fwxdVy3b9AQndkISmq0WhlcZGG0oF
	5B3gjQ/eaat/3oHqDoL3xuTiBvAm2NyGRx+jo43Oa5a85XlBhVF7Itdfg4XQHCrPVwb6+Uu0SfoyG
	eZZ9fDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuH3c-0000000EQs4-0Oek;
	Thu, 04 Sep 2025 20:59:48 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCYB-0000000Clnn-0BPe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 16:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1757002247; x=1757607047; i=markus.elfring@web.de;
	bh=fnB78AZRybzXGEGbKEs063u7SIqqC/HQB9Q8uYop7u0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=j6dbMiCAmToyLG7QSjEg71uRAwDqm2Gxx6R7gW36icVtVDxze4ov8wgoNoRbd6XH
	 mIuisnKPUJ0fV4q57tDaol77XbtMrlf/8Vdy79ko16g8NT5z02bEn6octU8SLzDF2
	 CliJP+3BEcls8zBcb2yqE+cDcgGI4evHze2n5b8e+FOgfXGNzwJm2uxl5cSepXtOz
	 hzFzW1MMhG9iFFSRE7ERbv71gUD6CmdGZ3o5vknQ18MsmxrHSyH8gakrjtrd24gPi
	 n4kuW3Xp/2pcbu7eV7qPK+8wjqUaIBujpMtWWzRfMc8Dk+kArgUEUCN0kVMdDt2zo
	 IxfGL4kKIbjUVofVWQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.243]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mm9VU-1uC26h3U9I-00ZwwA; Thu, 04
 Sep 2025 18:10:47 +0200
Message-ID: <b8dd23cd-9e95-4e2c-8388-54b6d184bcf2@web.de>
Date: Thu, 4 Sep 2025 18:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>,
 Suzuki Poulouse <suzuki.poulose@arm.com>,
 Tamas Zsoldos <tamas.zsoldos@arm.com>
References: <20250904-cs_etm_auxsetup_fix_error_handling-v2-1-a502d0bafb95@arm.com>
Subject: Re: [PATCH v2] coresight: trbe: Return NULL pointer for allocation
 failures
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250904-cs_etm_auxsetup_fix_error_handling-v2-1-a502d0bafb95@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mESZX6zP+LT4CwfOaT3Tw2Lu31CAMmq3HKoGIqZruq9qR1l+/9P
 eFNhZfS+vYexXYa+LLYrAcVjhO/LjXdBqJOCPA4nsxTi6cLHYTREMkzhVHomhL5pV4FxP/Y
 9Ry//pvBP/AxKlcV61Zm8mln4jg1RhrHfNnowlaqqoeyTQVj7AUh5zGao4Yw+WE7taLM/o+
 twHWaaNF8NqjfEFoYlEaQ==
UI-OutboundReport: notjunk:1;M01:P0:+6GZ3kqxxJA=;BvHYnxwHh4TC9+qn9+XS1NIsI0W ijwFH8euKSaEwx56sgc5WH3PJ6yMRnawjEIy2rTpWMSOYmIRIhA1A2gIX8OUoVBFmVVbC7PpN GULgUO24Q3GSl/2CvNNaOjo9lK6QzBlpHilvGcRJZH3NBMrp0exhZySkmGMyHXJn2AgyRXYmI HvkiTqAT9r0VqByO3pQsPzo6PLNmMO4QH0oalRZ1SwMA5KIJJ1Sai7qcNlwRtNSr316fiP+8d hVFqpwNNAEbsiZHUEdDLe1iwgscd97P41jTnmxaWXE9z1OJQxoIWaBCuiDIZHkQgETjnRKMOo cpwt91oHJPtdqtP7P83KeenhX9VPZuFf3Df8MdiluHhjF+HtdmaY8H1MobYbxFNWrk1ydNXVB nKlXfVDuDuPsnCqUyn9tcN9J63s9o8Fdm1bTaJmh/aPM60P+WRbeaYkLT4KO8vV6TqfgWGpJK yAIyuHB9ruFh+ENab5FqxOJBpD2VvwrBoKCEA14obys1oa7EGfEQkdc9e4mTMjxgD5adRerPD uIP/sRHU2ke49NnsOB/wMj8Fp1hmThkAVzz6lfwyhidZXlT61t5i+cVpO6uO/PSBurtw8G73k +OxA3c2H3CDFIOdlBH0CypEp3gDeCMsZLKAIrZUYeoDgs017xy3Eu6AIcv+twRZmPI3gOzW/g VWZY2Hujp+SaZX815z5E4TZ+nkCtgG5dmLnhhRBMAaZnvgwe6b1N4wziezinEuiARktyHv08m icny8tTrTv7fOD+vH/A/pT+oAjeWWBZJeFvGjioMA5o5NLlZ2/JzbL57CU8s12CiGX17OMl/5 esS/PNIcxBmrAE0bdN3ZnzPiCUlkkbr+Jt22KX4bo6oYljbVvtgN3nwryJiHDpnQT/d4RdodW Z+05sycRYDRfWmYqusPc/IaLwUxT7jy7PUUuyM5icpPtmcDq1UdFZgL3QFfRxJcq37HuJ+kRe FnjhWzZin2/0SrAMS7LqZfxEPUVHVt22DTApWzRTFiIeZ7+VhYjuH1vRjyWPEOcAAYn15Bny+ Nu0y+wISSF4tdLirvD2iJ+IigcpITgWWufC6ONhAUz0WsZco78AIeeZGvkiOyDg9U9gjFwcgd jgtANKtQrv/C1UJAZtsWwCo3TjF0MJOSgBnjJm162dT3kUx6ns7PYL1vZ5S95ABMdOSAqKEJV tHEn/pUVzPXWcy/bxqWGLkxqPMwjaVhsuB37blQ3N0QNrcpO4zyG1ddd2135J3Ew1HkGisttw ZeJD4Hp5vm5mN74DvyTZBEtaEO2ZRWF/vyGTK+glF5bpGUzuZe2CsAjewlybSlZDKEofCTqqg uuxehEpdawJdbPeMRxuloUNyCCKJ8qXh6G0piEdCuv0ALMp+4F4YXjbUB+LqCLsPEbLlAocgX rkIA/rmVhgNLzB/EBKKBYUl+A+ieky3z8rNkd0UVQpdnp//Pls4y/AfX2Sr9bDRfoQlL3VVfP V2mm4Sm7dN1Lx3fQ4P990qRsnx6vlHjoONPm6TlbS/u7x3OPBKIvwebG9SYMErep59pO4BlMZ b92xymnf7xoI+EU8A0LIL8iWr7rA5yl6RnDniDUCKSMPQPBcz4cUYMLZHTnUOyMSnrZ8SrYii gFWkRGCLiveSs6IV3MXmgEfPMeBghu3HbvyHSYJsL/vsJaoxrqqqj/cqwAERUOXIZ9j3+nYgx kGgu/vufRJFnnFftHQlswbuz+jSF/zxSFudWRbzsmzWowS+ttnn6szbcq6HsignGx7QpRcRn+ 3PSitH9nU6pIgcC4yJ9aWEyqhFSIurUST3qKwP+XRw0lpHNM692pkodjNT9+9uSzslhYRqJzf nIw8qL9Vq6sN7F3sNFAUq8F1MDRMLTa/cQ34BO1tlcFN1RKS8nZNtQQM9balKl0I6fQlcpzHe YJbBl0ZKfrc6NQMPQcoKwxTjOqtCysltYdLE48qd15RQXALaqgEqMAewjgsyw6JtfEOMUPpjK kLdijGPgR9cqiBJy32EdylnNztCRhcLw0G21KeScZvSVG0x9cHp0KD5kiUEYzux6YDlLZDJkv Ff9fyd7Io1hEu0tkV6+f+jEyYQYhzExRGAQ7U626V/1l5diOz/+phnh2VTchyYEqzYD9fvEy0 MXgAdzvVTHRnMWyeks8wsQ02/bsa9NCFg60tYkp9pT1dCTXK26vjAGRJnpnAtQCQ2CCjfebaV A31ewFLO3jnQikJlzD5FuBN5aIJdo2fCXxuiLf9iKVXAhAmJePWCZToRMmeSTW6DyG9lp6ab+ qgfSe/Gk2JP4M4r2fO1ddJPUE1w1ChmYuJ5b80CotKXRNA2GFPLmWImhkaaPVeOvsnf3GK0YX UW2eqJJUxXxSx/hbpaFEv7PH4JQTloMl/LEfwHr0YCm+DUvnTICmsP7CoQxJ89nYn63vkIXsA eqQYRrPyLLKY7d5BUsjh/SFGxU3I4JASMFkZQgCNyip3lCuDe805O3VYsHUFBcvz1dvcFUggX LNmTavfnVHLbjyZ6VjwcaQZKCsHM905HvsJ1xbGRv7uKoL/o8VAo+RHPOR+tgXw6ycFCL9nOV s/h12RZWQ7cCzZhQFZC8DS6f2i4RGA31b8YOlfLJxTcXYGwL6IjfkhTw5xpifAeYZe6kI/Imt kUrGq9sjXJHAFSf4GEU+9trK/CC4UDczsJnwzFax7HWYkprpO0ezKg3lF6vFVBACaj5AM0dxG APx+G0retHigR5DOJg2EaOv1y5bn6w3LFX++/v5lWjL1dHwFYVEGr3uy4KpdS7l50D2Y14uLr VUqvLX2Tt2VmQVHAG0lzDjUmQ8NE0TzeSrSyaayti967wG4ZexahH0iEjYNY8yorz4j4p9xUF XakABqz3SypRsFcC7LQwg9rEGnGy7SH9zon4ZVlqyDP7/8hRQurN2BSTyKlWgDCnp75dL3kMv zU7UPJqlhociptFevYWn1KNK8xHHC4w8+NkB9Q39yOiPawLM5Ce7U6Y3i8mgMYYBxQpG8F5V4 zQeYBWZXpcUT772gpGMSV45atxr3Fpbqzotk/xoJGnCWEap6zcvjaropM2UVvCYgDl0Lvv2+j rXkXR5Q960r/zjKBwR8o4NY/6vskI6lTRADegL91YaxUrZChhJGn7vF7dmQlPYqZXByMRAu6b URaAKeMohPiduLcCojJTSYJ9vOWgbnxQtQwP87/3PNCtPuAxuLAEUI+4livAtS2Vyiam6Foeu OeZWJJNygFMYJ8e5mMmvisVsWDQDS0oR0ugOwyxdj5GCoHFxc751p+4jd7xkZbqoY7pNDhF8t bGqjaohwdX9ANcSf7JLrN8OfZ2/kbSua4zIcpMKKjRwSlfKcgR47ychNtSySEOdDeuCx0khEO AbxmSzg3CTU05pZ6EBcM3jaUcVI6BRC4kBdDh4rYHHRefihSYbO5TLQKbO01eAQRC8rGvMuy5 pRlugWyQM7+RUSCFjTa4NXc4Ln23ZOiCFj5AgbEzlXIaMfnXp0v1y0+98ybUzCeo+KDJF+Mx+ cW6DhJ2J3T2bU/f7cYZ5Hr8KHHwtoWjqOZxAhpVHCmmSYkLKp3/6XHxI/2NlOjK8pfZxdl69R ZQC70pbfojG18AdPMIqtcvnxy0ILfVaXsymmjt0hNAbB5P9EtUaFE+8tlLP+BTIbT3ni5NLXO mlGMP+J1YlnhrpRlJ7dE9cN/OHpNyfvK0S4jMRnJYoYpGYQbmbLlJFu8nLb9pqe2cAWjNwEst qLMn6Bignjso8bW+L+foS1jQ7O5Qq66wOxMtw+P0VvmFu2bqf7uH6iNiAnxjFyKY4cxiiJ86N 5qZ/c9hM2h79XXwS9+AHE9R0pz7FJtA5wWAXgjpt7mkhhWa1ViI8DqU0ws2v0NzO9p5m1D8dr LOT+udzSYqRCiIcYZArS+Qv5h80HpOmo6P9rV+RwposuHsizzDaMTK9HwsZ0maN9Z0e39yooz
 T7OVf6Ecie/TOruoYcC3DxfEGEd2dXU6D/o7jcKbSBVS0yeIdS0eWM7TRDhkUxo0+Y1PI/fjJ qdMabhlKQzY6UN5RwL/PYkHTNqE9pXMHUrKsMqkVec1yC74ijpXLhBhwZxzZLfJ1rPR4VJwYj YxF31KuT4r+1yfoFfPdCU3bz2wBOmSctxB4EFe68AErc+PJSPqp8h17o0tiG598Ixrdiya2Ld 1GNaqVNTUAUCUxnVxBi42rydyEntRMbz1HOXBjn4SK9FvM4P8xU73HtPOSiNPk6FervGblNLi xE4sWeAky7xyH5xMQTzgUo8AHRSbo7ZDR3DVz0twWLAJw0D1aSBwKEJvc7M+wXH5VjVAK4i04 8El2wfAyGRiG24jN4fppSoT0yPmEOA0+wVM4Q6JK2nru1RXYZZii9kQqISARFzWQ2796qL0EU /cDU/m8IoDJ4mmkccO5IdBL4x7wuCqNW5jijaxe2onoWOlPFvj6XPlaFHbWhFH4lHTX/Gu9Tm rK3osmG+GfDmF2vjLIAqZaflSEY2dvJV9XrBcgnLDa6QJQzefjw4svhYm4VjVuTTmNnXDB8jt 4kteb8sTfxyPclZKwQAYaoix/I0eEzowR61CbjbKYsAazVQ4k9J+S15J/sRfQEEbLGMHOYHT0 6GUhqHNIp1S/El2uyMBNxqR4iHE/56vcfn/1IM4NbTljcwT0P6ozBsKbxsvtonTGukPzzIapy sP7D59/CGqP0cHOGuo1c4lOH6eew3enX8JdLrb2Ut5NZNm1NfUn1SftoIYLZKG1manj9lTy6o +COStQD0Q/9Z2pdlNX+iNvhbqBsuATzOBljGHnaERM8zotMkeRLe2UpWNCS1Vd50Uf2y4Pwb2 +KH03cusWk/knGkJhLZnhz0Ps/EeLdpXEkzeiqsOQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_091103_373222_7FC3D048 
X-CRM114-Status: UNSURE (   5.22  )
X-CRM114-Notice: Please train this message.
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

=E2=80=A6
> Fix this by returning a NULL pointer from arm_trbe_alloc_buffer() on
> allocation failures. This allows that the callers can properly handle
> the failure.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17-rc4#n94


By the way:
* Would you like to improve the exception handling by using a goto chain?

* How do you think about to increase the application of scope-based resour=
ce management?
  https://elixir.bootlin.com/linux/v6.17-rc4/source/include/linux/slab.h#L=
476


Regards,
Markus

