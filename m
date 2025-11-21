Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D38CFC26F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 13:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnqwdaA5dWUbYPOBzVA/TgPmN1pvq/3tSA2sot+sBr0=; b=FUf2DVkRFO9vcEX3pZPr1vO1CP
	umWGcYuUTzgOKPG40FVjwDUOnnhDKjy+Wdus7gXPo+K6uUvVBc2aWVacdxcTlL7QZ82WAK7x8mS/w
	yrNHcJC3Okqyw+WdDGL+VclvzhXht0u4fv5RJDgFRxzxqY9BsQ1+iXEMbHB3uZn1195OtcaEUtraV
	lkPUMejR/omV0Z9yRs2GovHx1WfOMO2iRgpp/ETqJu4jff3tOg158DigJASH66lzbUbzEcpCqHVoS
	HK6pPE4+VN19/vXwdS0rFxfDvRa4Pe9XiJMxFQ2D8g+S5iYOOCSlcbo+A5In1zgIY2yn3PHOOor7B
	1F8wIHNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQuu-00000008OlY-37zb;
	Fri, 21 Nov 2025 13:11:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQut-00000008OlH-33VC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 13:11:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B3C260233
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 13:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89B7C19422
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 13:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763730669;
	bh=JIYgszXNH0+jUKbQeR1Qnn/VbarzzshNt59U4gEqEK0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V8n//RAoJaXbyG/NykKaLbrkpW9S3T/XfJSSPZvw/T+v/rlrCrjAUtEhNTOfasiGc
	 sH8oRb+G5/TVBpeSYrgfxws/B+fZy5/Ad/nbH+vzMgAYrDKZwT94xRzFETzgjeTadr
	 koJM6ouwQ+O6JEJVwLnjv9Jvcp3wgLRIEMSYddi/+TKEGrtZQI2NRQcRcnNGJa5P9s
	 V9hM+HUmFeI28PwiyaVX2sFA6G+gsIwkBq/nszvnDvBhidLgz40UuN1eLWn9gUm32W
	 xrpmhB9wEHwhmRBYUeSBbSlTXDevUoUudgM5QY5X0vjmyQq0DbubQCV88/OF4vQZXe
	 xcKhJY1X3oBjA==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-3e41b6469f5so950127fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 05:11:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVP3yIw/F0DVSr0JiiDgfKRW8KuKUIFVuCIbvNr3D/cmtlgBgURFIRBZXHwOpeHKAiapBc0tjlQ0KOiM/8G+b7s@lists.infradead.org
X-Gm-Message-State: AOJu0Yxuv0Hx6HobR6TkfY9Wq65/KWkHrHIOy5y8eSt5zdBn7eyXXcH6
	hwaMKZM04ZxE9e6D60aZF+AADFN5VBtB+ompXR8TfZTQoSKkX7872GRRgodSo4gKAUUER7BpSSD
	2CYohYe0yBUXynTVwFG+TK8BsTx1e0os=
X-Google-Smtp-Source: AGHT+IGN3qq9mxPnMrC9Lfj98rFkvXMzHsdrNeR1Gcm9BGsVmmtpx4DeRJz1cZ8PyQVmNJWLKd/C2lpyhpx400YUIdU=
X-Received: by 2002:a05:6808:2110:b0:450:ba5b:a46b with SMTP id
 5614622812f47-45112d8cc9bmr807890b6e.64.1763730669214; Fri, 21 Nov 2025
 05:11:09 -0800 (PST)
MIME-Version: 1.0
References: <20251121010756.6687-1-val@packett.cool>
In-Reply-To: <20251121010756.6687-1-val@packett.cool>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 21 Nov 2025 14:10:57 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h1VTozCKweKvma3dQiUCz8KkR88Hue1cL_jDaKiP+BEw@mail.gmail.com>
X-Gm-Features: AWmQ_blcWB5zoePI22y4acEeAzm9bTDT2TYoTrkXb4JkvJhzZsLYBoEjcWPdnG0
Message-ID: <CAJZ5v0h1VTozCKweKvma3dQiUCz8KkR88Hue1cL_jDaKiP+BEw@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: warn and fixup on sanity check instead of
 rejecting the driver
To: Val Packett <val@packett.cool>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Christian Loehle <christian.loehle@arm.com>, 
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000004b6f206441a8c22"
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

--00000000000004b6f206441a8c22
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 2:08=E2=80=AFAM Val Packett <val@packett.cool> wrot=
e:
>
> On Device Tree platforms, the latency and target residency values come
> directly from device trees, which are numerous and weren't all written
> with cpuidle invariants in mind. For example, qcom/hamoa.dtsi currently
> trips this check: exit latency 680000 > residency 600000.

So this breaks cpuidle expectations and it doesn't work correctly on
the affected platforms.

> Instead of harshly rejecting the entire cpuidle driver with a mysterious
> error message, print a warning and set the target residency value to be
> equal to the exit latency.

This generally doesn't work because the new target residency may be
greater than the target residency of the next state.

> Fixes: 76934e495cdc ("cpuidle: Add sanity check for exit latency and targ=
et residency")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/cpuidle/driver.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/cpuidle/driver.c b/drivers/cpuidle/driver.c
> index 1c295a93d582..06aeb59c1017 100644
> --- a/drivers/cpuidle/driver.c
> +++ b/drivers/cpuidle/driver.c
> @@ -199,8 +199,11 @@ static int __cpuidle_driver_init(struct cpuidle_driv=
er *drv)
>                  * exceed its target residency which is assumed in cpuidl=
e in
>                  * multiple places.
>                  */
> -               if (s->exit_latency_ns > s->target_residency_ns)
> -                       return -EINVAL;
> +               if (s->exit_latency_ns > s->target_residency_ns) {
> +                       pr_warn("cpuidle: state %d: exit latency %lld > r=
esidency %lld (fixing)\n",
> +                               i, s->exit_latency_ns, s->target_residenc=
y_ns);
> +                       s->target_residency_ns =3D s->exit_latency_ns;

And you also need to update s->target_residency.

Moreover, that needs to be done when all of the target residency and
exit latency values have been computed and full sanitization of all
the states would need to be done (including the ordering checks), but
the kernel has insufficient information to do that (for instance, if
the ordering is not as expected, it is not clear how to fix it up).
Even the above sanitization is unlikely to result in the intended
behavior.

So if returning the error code doesn't work, printing a warning is as
much as can be done, like in the attached patch.

If this works for you, I'll submit it properly later.

> +               }
>         }
>
>         return 0;
> --

--00000000000004b6f206441a8c22
Content-Type: text/x-patch; charset="US-ASCII"; name="cpuidle-warn.patch"
Content-Disposition: attachment; filename="cpuidle-warn.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mi8vnx550>
X-Attachment-Id: f_mi8vnx550

LS0tCiBkcml2ZXJzL2NwdWlkbGUvZHJpdmVyLmMgfCAgIDE4ICsrKysrKysrLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgotLS0gYS9k
cml2ZXJzL2NwdWlkbGUvZHJpdmVyLmMKKysrIGIvZHJpdmVycy9jcHVpZGxlL2RyaXZlci5jCkBA
IC04LDYgKzgsOCBAQAogICogVGhpcyBjb2RlIGlzIGxpY2VuY2VkIHVuZGVyIHRoZSBHUEwuCiAg
Ki8KIAorI2RlZmluZSBwcl9mbXQoZm10KSBLQlVJTERfTU9ETkFNRSAiOiAiIGZtdAorCiAjaW5j
bHVkZSA8bGludXgvbXV0ZXguaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRl
IDxsaW51eC9zY2hlZC5oPgpAQCAtMTUyLDcgKzE1NCw3IEBAIHN0YXRpYyB2b2lkIGNwdWlkbGVf
c2V0dXBfYnJvYWRjYXN0X3RpbWUKICAqIF9fY3B1aWRsZV9kcml2ZXJfaW5pdCAtIGluaXRpYWxp
emUgdGhlIGRyaXZlcidzIGludGVybmFsIGRhdGEKICAqIEBkcnY6IGEgdmFsaWQgcG9pbnRlciB0
byBhIHN0cnVjdCBjcHVpZGxlX2RyaXZlcgogICovCi1zdGF0aWMgaW50IF9fY3B1aWRsZV9kcml2
ZXJfaW5pdChzdHJ1Y3QgY3B1aWRsZV9kcml2ZXIgKmRydikKK3N0YXRpYyB2b2lkIF9fY3B1aWRs
ZV9kcml2ZXJfaW5pdChzdHJ1Y3QgY3B1aWRsZV9kcml2ZXIgKmRydikKIHsKIAlpbnQgaTsKIApA
QCAtMTk1LDE1ICsxOTcsMTMgQEAgc3RhdGljIGludCBfX2NwdWlkbGVfZHJpdmVyX2luaXQoc3Ry
dWN0CiAJCQlzLT5leGl0X2xhdGVuY3kgPSBkaXZfdTY0KHMtPmV4aXRfbGF0ZW5jeV9ucywgTlNF
Q19QRVJfVVNFQyk7CiAKIAkJLyoKLQkJICogRW5zdXJlIHRoYXQgdGhlIGV4aXQgbGF0ZW5jeSBv
ZiBhIENQVSBpZGxlIHN0YXRlIGRvZXMgbm90Ci0JCSAqIGV4Y2VlZCBpdHMgdGFyZ2V0IHJlc2lk
ZW5jeSB3aGljaCBpcyBhc3N1bWVkIGluIGNwdWlkbGUgaW4KLQkJICogbXVsdGlwbGUgcGxhY2Vz
LgorCQkgKiBXYXJuIGlmIHRoZSBleGl0IGxhdGVuY3kgb2YgYSBDUFUgaWRsZSBzdGF0ZSBleGNl
ZWRzIGl0cworCQkgKiB0YXJnZXQgcmVzaWRlbmN5IHdoaWNoIGlzIGFzc3VtZWQgdG8gbmV2ZXIg
aGFwcGVuIGluIGNwdWlkbGUKKwkJICogaW4gbXVsdGlwbGUgcGxhY2VzLgogCQkgKi8KIAkJaWYg
KHMtPmV4aXRfbGF0ZW5jeV9ucyA+IHMtPnRhcmdldF9yZXNpZGVuY3lfbnMpCi0JCQlyZXR1cm4g
LUVJTlZBTDsKKwkJCXByX3dhcm4oIklkbGUgc3RhdGUgJWQgdGFyZ2V0IHJlc2lkZW5jeSB0b28g
bG93XG4iLCBpKTsKIAl9Ci0KLQlyZXR1cm4gMDsKIH0KIAogLyoqCkBAIC0yMzMsOSArMjMzLDcg
QEAgc3RhdGljIGludCBfX2NwdWlkbGVfcmVnaXN0ZXJfZHJpdmVyKHN0cgogCWlmIChjcHVpZGxl
X2Rpc2FibGVkKCkpCiAJCXJldHVybiAtRU5PREVWOwogCi0JcmV0ID0gX19jcHVpZGxlX2RyaXZl
cl9pbml0KGRydik7Ci0JaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKKwlfX2NwdWlkbGVfZHJpdmVy
X2luaXQoZHJ2KTsKIAogCXJldCA9IF9fY3B1aWRsZV9zZXRfZHJpdmVyKGRydik7CiAJaWYgKHJl
dCkK
--00000000000004b6f206441a8c22--

