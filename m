Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CB8C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 06:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P38FO6+njKGYbNLvlE2BiPsC4uR35LU84o17Ihkf2Ts=; b=f5lHmOzPDVgyp/Fex43t9Kj8cl
	13S84EebPn1Ydc5fKfFp6L4pURc+Ip807dlmls1aN9nTPQZr0bn+vSmdqycEkYkOsJR2SlOv3LNwi
	VfzHPJsAlOGj1mfvWneQUqL/sw3oCwUHJS5IuZn9VIdnLDoqAT1BlpMQljdU+zTDpGJMU68e0VYIW
	iGymhS+pfuCxtoLQeLxiVPQ0PmHV5wtvWogQXOXg+dfjKFKxbXeL6xwEn8Lxt05gK2S0jbUIUQw6L
	Ze135mwEuM8qvvpiS6vTBvANiSlTfOjvZnLUazhBLbc5V/fZQy2Yr9BlJbB/7zVbAbjzX5ssKHi6g
	xu3pol0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ZGx-00000001a67-0VbP;
	Sat, 26 Apr 2025 06:44:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ylf-00000001WLP-2AMp
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 26 Apr 2025 06:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P38FO6+njKGYbNLvlE2BiPsC4uR35LU84o17Ihkf2Ts=; b=gCRBhQ0/d2rrP9YiaFBw6l6qXi
	KO/jdUHugBz0DUxTmhHD+0Ak4mZ0RphyV75JRVSQfI3R8xZ1KBkE0rxrygL3iVl9TbYgjnIhw5uA2
	kYo4IxYOsNwKzjZMTbiFIQ2fGfAqR4ToNOF/aZ7bm6D3NECgw87luLVYCMw4WQwkB/YcRoUn1ys++
	YVj8OEIszS82cKM8+Lzu/Ic8YnjuaFiNxKBkHwkorig6ZRxuv2bYbwifdRT4DAmHzuFPd5t9hGiBX
	1utVhBsp9hjgCJv/LuV1Pnems+hi/S/J3diM2B1KxFqNUwBIciw72S/VhJd7Jxj6UZyp702m7V57X
	nSODycCw==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8Ylb-0000000CDVr-35cw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 06:12:02 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-acb5ec407b1so495522166b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 23:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745647917; x=1746252717; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P38FO6+njKGYbNLvlE2BiPsC4uR35LU84o17Ihkf2Ts=;
        b=RzM4AwF8WpQ6F103Cn/4kmCCkfHscf1C+dofvo8SDmlm6GwqfXdagW6ZKxpxRCSn8d
         9dkO/WNTGX7SHaxL1Q7P8agqvST615n8HJ6O1G5InY54qGPIXSc8ee1oyMDkjU+/7hpV
         QBsCRj0Yje+ZPJBe5prv30jEcPB+HWr4oTberi5FvmCLdyxCa0JNCE1AxDjlo9kJSWtn
         TuSqQJIsuFcOXNMk0KQvSNV4Mvkal9WuKYEOofBIhJHvOsxzsXNIpAGcxmiSDrDIQIWb
         yaIOQRsyO/AIyFSN5HhWzhTzyz3r9/r45HjM2MmLxPHlPR7/wrQoCUkxzUDXM4WZg7JJ
         8sXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745647917; x=1746252717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P38FO6+njKGYbNLvlE2BiPsC4uR35LU84o17Ihkf2Ts=;
        b=KN9/8yfCxlrmEdXTxQU/IG2Hz123UUUP6BvE+jhmw3hdKJLLTIK2/1krUNcFbCRzLD
         dtXQdGPFRRRB3IGOyqGyAjnj3Z5j5vXaGi0nCwH8Zfd0aRl6Vc6x8qzq/IGw18ctzEgV
         l+UikWDVRWYzKOwxd/07tiQah7Qkhq7QSgCwY0j9+tFs5nKLuiaIydMShK5ko4Qz5O9B
         u2DkpAwGK4xS9dkgL6E82R5Vr/qsJNkAqgFa8lT7edf8BEOxe59YzUtCTEGcpDQnyHqa
         0ldi6HBmccz/EBmEuu2+Sp4phhZWc9I4/DHkpk6+xu7QSWIoyrUH3oOY4Qm/67Qr5zgm
         Zp9w==
X-Forwarded-Encrypted: i=1; AJvYcCXhvQo/WBIqR9izhn7wAM7sJ1qsiT1nl3CzM7bNwWwS+Pf4zJsPojZeNgEwmVT0si4F8GLCOnwthBm1RZSeY6Mw@lists.infradead.org
X-Gm-Message-State: AOJu0YxmjiVAsKA/eup1YFQ9s8POhsGO0lvVucPbRs/uiCkGK84bk9Gj
	QjGtd21wKLPIa/77LwjmVIaHYuGhJIP/Ka4jnuvR2EvLxPJeoM1tFGhbDYcYQcjbJG8ABoEgjMY
	aWuwaAoszykeRj3/C2k8ExEaroY7nWg==
X-Gm-Gg: ASbGnctY8EvHLhTiufMj63WUzodseKkHRF4DpbRCQCRgnLJnM+Q4Ly4ItcdU/cGtvAr
	kew4M7BW3EKwtciRb5KRES7xAsxIa+DyjXw8s2zRnzLNOt0SMkBWn7U8AaQAGexrcHOgV+69BSv
	Tzmy8nj669nlFbbSsJYnEY
X-Google-Smtp-Source: AGHT+IHU2LAHVM0ylRli8MpkgrQDDetTqppf6CoDV9/WpYVkZ1mZ4e/r3+sZhdqb/QIeFysUMK1woTg4zHQWOMLWRkI=
X-Received: by 2002:a17:907:9483:b0:acb:b5a4:ba35 with SMTP id
 a640c23a62f3a-ace848c047bmr165437266b.2.1745647916581; Fri, 25 Apr 2025
 23:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250425132727.5160-1-linux.amoon@gmail.com> <20250425132727.5160-2-linux.amoon@gmail.com>
 <34087c68-442f-41ec-a6c0-dd063f6d44d1@kernel.org>
In-Reply-To: <34087c68-442f-41ec-a6c0-dd063f6d44d1@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 26 Apr 2025 11:41:39 +0530
X-Gm-Features: ATxdqUGVUzKx6XU_cLPV7j0MBc0wnh_fXqMndtXtKNtM0VKtPEyXHniD99OhSmo
Message-ID: <CANAwSgT+ZXacTZJzVbu0DQfYQYUUjMc41jKnn7E_E1wnhY1L6w@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] dt-bindings: clock: Add RTC clock binding for
 Maxim MAX77686
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO..." <linux-kernel@vger.kernel.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_071200_136531_F91DEC69 
X-CRM114-Status: GOOD (  16.71  )
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

Hi Krzysztof,

On Fri, 25 Apr 2025 at 20:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 25/04/2025 15:26, Anand Moon wrote:
> > +
> > +  The MAX77686 contains three 32.768khz crystal clock outputs that can
> > +  be controlled (gated/ungated) over I2C. Clocks are defined as
> > +  preprocessor macros in dt-bindings/clock/maxim,max77686.h.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - max77686-rtc
>
> So you claim RTC is a clock, right? Did not even think that RTC has a
> bit different meaning?
>
> But regardless, this code make no sense and was never tested. It cannot
> work.
>
> It reminds me previous approaches with whatever patches you found in the
> downstream...

Okay, I found the MAX77686A datasheet that Hardkernel shared long
ago and tried to interpret the information in it.
I will remove this repo once this is done.

[0] https://github.com/moonlinux/Samsung_user_manuals/blob/master/MAX77686A%20Datasheet%20REV00.pdf

I have gone through MAX77686A the regulator and the datasheet
If you have some improvements to the code plz suggest so,

>
> Best regards,
> Krzysztof

Thanks
-Anand

