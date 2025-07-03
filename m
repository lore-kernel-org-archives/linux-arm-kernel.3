Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85561C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsy3o+a5LwN2jUmSXKdFxPZ/Sf0ebBo2DlMLfM6qA2Y=; b=y3tvJpiMY7Tg3v34bmpgksqFsM
	YoeXD0XAlFbojOx8Gi+NVmt+arWYSMAUigmKYcCS15FsDfdWQMF2tFFtSz03Pvyy+w/9C1KGOGGXp
	paTpv2GnlKcfrT8om7J1XI91tJOevyVHmnpgBK0+63OE/x//R0Uv3FXhQuyn+7E9ShWRRAGTClARN
	OaqSMTDfofYQuycPGXFgkdHH8Ak6HnyW3wQ6NkZvPAt+Ma/nWbPbyVAMAoJq/54zPlXT6QZq9uZtv
	VlsvxcNU3DWFJHOYdfXbdUsusMMrWhWCxId1MJfhTsLPxg4PgygMs2N/nwPhfjPETAzLXkorAE2L/
	YPlh5rHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGyH-0000000AxS3-0U3v;
	Thu, 03 Jul 2025 10:15:13 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGvl-0000000Ax7a-3kxO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:12:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-453647147c6so83328345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 03:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751537556; x=1752142356; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zsy3o+a5LwN2jUmSXKdFxPZ/Sf0ebBo2DlMLfM6qA2Y=;
        b=pc7HNRhiT1E859+AuL1sYtv4WJB0XUU72cHNG+jUBzZ9uTVbHGwOHYK3dWOWP33MUT
         6+wAuz/uhdy4EoHS///ovU+mNvJ4LVxE8DvddMQlHlSB0P1ag+9O8EfML0StyxK77ScW
         LBMCZL/XbIW7cyCj4gWoomnmH7NmSSiqmADK8wl2toBbFTLhKUOmJf90A2SfOCsaLMcd
         qKcbcOd4Im5J/rimfL545rnP/Z+bftGb6nLlUi3INE5wCVWDQkR/+wisCA8iClRtcXaT
         v8OH5vMhksaE+0MxE0I4kSE5mSStmp7WAAvt59m8/xn4xT+uNkxZG4O5/AcSvLDxzraf
         W1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751537556; x=1752142356;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsy3o+a5LwN2jUmSXKdFxPZ/Sf0ebBo2DlMLfM6qA2Y=;
        b=GjSUMgthnU/+DZZGPm1+wNlgIB0JD/5jwj/fpKLJuZx+KIug6aP6NdOIhcOpswqEgV
         2z/jnZZE6lRqcn7nE0H1ZQ9faJlIEbcRSpHTF6lKbP0Lj9m/2dFdDV9wCHRv6Jha570z
         6O30WeoQvX3qg4AN/3YiAJCfWUl+yLl7cyIIx6249tx64VOM8qostN4JovNYJ1upDSZi
         6iqryAFvP5RRhVnup4vxBqJ3O7L3AhTDrn9+5ocZ/9SIkrw0yBwFXqsdQjdKMF8M9rBX
         HSbwHWb/gsT4pf04lfBphk/gohT5sN0Eu5aH3rr6LN/beXty7XDBHQPrMSYbcPolGbvs
         mpOA==
X-Forwarded-Encrypted: i=1; AJvYcCX8y1sBcsc6VHYZ/7aYcxMtTQ0ctc2TYfLAmWVqDUOpvyPnxi8gi/rN+pUH3LOKuxuilq3Pw6DxUlSuVJOlbe4e@lists.infradead.org
X-Gm-Message-State: AOJu0YzzKupqfIbLYDVdutlXYdb7niT4WJU/GiBZpA1qBfVD/iZ1eHv7
	hfUAx36RweuS6OqIOtiGjfELUvOde1+8yh9NX3SYWtpAXANfymXcqHdybHyHuMNO/8o=
X-Gm-Gg: ASbGncsWAqMATFwwfjyM0uNL5xKTGDMgw29LbVYWITM/5NJt1mkETzmBRpuwfutbPKv
	3qrp4oKKcm/UYKGaS2lAyGFOvmcZPppA0ULwehfGUucRxqPsnEdSXIFuJ2BalNWJPAW92uCA0Yu
	kJk+BOiuVhptVrDBlTvBnX5HcUIBokih8QSVJl7H1dl3SWEzX7/1RpmTALbiJaWNF52Q/Ku5d58
	qEHZyZ2gxBATzutcKh0f5stWBYnc+X3bM8taO1/ZEoqWhQ6EWyKw++3PMSz/Y4CORZR1dRRviQf
	P8FjHGSyfFOwAIucl3VxNMlxpT2qGZm+dMFL9Ma0vb1SfYMTl65tbyg3UnAmh4YpNw==
X-Google-Smtp-Source: AGHT+IGppM52segUxgIPv47hrycPAIwz2l2DAMekCZpVZr+AEqBxKXhYAJco74IOHWkjBbVxw0/FcQ==
X-Received: by 2002:a05:600c:3b01:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-454a3732ff3mr81884355e9.30.1751537556220;
        Thu, 03 Jul 2025 03:12:36 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e591d7sm18532443f8f.67.2025.07.03.03.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:12:35 -0700 (PDT)
Message-ID: <91a9d4dbe5504c493856ef81b30d98e7da925ac0.camel@linaro.org>
Subject: Re: [PATCH v3] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Date: Thu, 03 Jul 2025 11:12:34 +0100
In-Reply-To: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
References: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_031237_950540_B96A63E6 
X-CRM114-Status: GOOD (  23.88  )
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

Thanks Pete for your patch!

On Fri, 2025-06-27 at 14:08 +0100, Peter Griffin wrote:
> Register cpu pm notifiers for gs101 which call the
> gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> hint. This is required to actually enter the C2 idle state.
>=20
> A couple of corner cases are handled, namely when the system is rebooting
> or suspending we ignore the request. Additionally the request is ignored =
if
> the CPU is in CPU hot plug. Some common code is refactored so that it can
> be called from both the CPU hot plug callback and CPU PM notifier taking
> into account that CPU PM notifiers are called with IRQs disabled whereas
> CPU hotplug callbacks aren't.
>=20
> Note: this patch has a runtime dependency on adding 'local-timer-stop' dt
> property to the CPU nodes. This informs the time framework to switch to a
> broadcast timer as the local timer will be shutdown. Without that DT
> property specified the system hangs in early boot with this patch applied=
.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

With this applied, I see the following during boot:

[    1.841304][    T0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    1.841422][    T0] [ BUG: Invalid wait context ]
[    1.841550][    T0] 6.16.0-rc4-next-20250702+ #54 Tainted: G     U      =
    T =20
[    1.841727][    T0] -----------------------------
[    1.841844][    T0] swapper/0/0 is trying to lock:
[    1.841965][    T0] ffff000800ee84b8 (&pmu_context->cpupm_lock){....}-{3=
:3}
[    1.842001][    T0] , at: gs101_cpu_pm_notify_callback+0x48/0x100
[    1.842309][    T0] other info that might help us debug this:
[    1.842613][    T0] context-{5:5}
[    1.842987][    T0] 1 lock held by swapper/0/0:
[    1.843442][    T0]  #0:=20
[    1.843859][    T0] ffffafe9d8f1f100
[    1.844282][    T0]  (
[    1.844618][    T0] cpu_pm_notifier.lock
[    1.844980][    T0] ){....}-{2:2}, at: cpu_pm_enter+0x30/0x88
[    1.845340][    T0] stack backtrace:
[    1.845855][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G     =
U          T   6.16.0-rc4-next-20250702+ #54 PREEMPT=20
[    1.845878][    T0] Tainted: [U]=3DUSER, [T]=3DRANDSTRUCT
[    1.845884][    T0] Hardware name: Oriole (DT)
[    1.845897][    T0] Call trace:
[    1.845909][    T0]  show_stack+0x24/0x38 (C)
[    1.845934][    T0]  dump_stack_lvl+0x40/0xc0
[    1.845949][    T0]  dump_stack+0x18/0x24
[    1.845956][    T0]  __lock_acquire+0xc68/0xd90
[    1.845976][    T0]  lock_acquire+0x14c/0x2b8
[    1.845985][    T0]  _raw_spin_lock+0x54/0x78
[    1.846011][    T0]  gs101_cpu_pm_notify_callback+0x48/0x100
[    1.846021][    T0]  notifier_call_chain+0xb0/0x198
[    1.846046][    T0]  raw_notifier_call_chain_robust+0x50/0xb0
[    1.846053][    T0]  cpu_pm_enter+0x4c/0x88
[    1.846063][    T0]  psci_enter_idle_state+0x2c/0x70
[    1.846078][    T0]  cpuidle_enter_state+0x14c/0x4c0
[    1.846097][    T0]  cpuidle_enter+0x44/0x68
[    1.846121][    T0]  do_idle+0x1f0/0x2a8
[    1.846142][    T0]  cpu_startup_entry+0x40/0x50
[    1.846152][    T0]  rest_init+0x1c4/0x1d0
[    1.846161][    T0]  start_kernel+0x358/0x438
[    1.846181][    T0]  __primary_switched+0x88/0x98

>=20
> [...]
>=20
> @@ -444,6 +586,18 @@ static int exynos_pmu_probe(struct platform_device *=
pdev)
> =C2=A0			 */
> =C2=A0			dev_warn(&pdev->dev, "pmu-intr-gen syscon unavailable\n");
> =C2=A0		} else {
> +			pmu_context->hotplug_ing =3D
> +				devm_kmalloc_array(dev, num_possible_cpus(),
> +						=C2=A0=C2=A0 sizeof(bool), GFP_KERNEL);

I haven't done a full review, but sizeof(bool) should be rewritten as
sizeof(*pmu_context->hotplug_ing)

> [...]
> =C2=A0
> @@ -471,10 +628,32 @@ static int exynos_pmu_probe(struct platform_device =
*pdev)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +#ifdef CONFIG_PM_SLEEP
> +static int exynos_cpupm_suspend_noirq(struct device *dev)
> +{
> +	atomic_set(&pmu_context->sys_suspended, 1);
> +	return 0;
> +}
> +
> +static int exynos_cpupm_resume_noirq(struct device *dev)
> +{
> +	atomic_set(&pmu_context->sys_suspended, 0);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops cpupm_pm_ops =3D {
> +	.suspend_noirq =3D exynos_cpupm_suspend_noirq,
> +	.resume_noirq =3D exynos_cpupm_resume_noirq,
> +};
> +#endif
> +
> =C2=A0static struct platform_driver exynos_pmu_driver =3D {
> =C2=A0	.driver=C2=A0 =3D {
> =C2=A0		.name=C2=A0=C2=A0 =3D "exynos-pmu",
> =C2=A0		.of_match_table =3D exynos_pmu_of_device_ids,
> +#ifdef CONFIG_PM_SLEEP
> +		.pm =3D &cpupm_pm_ops,
> +#endif

This can use pm_sleep_ptr() instead to avoid the ifdef.

Cheers,
Andre'

