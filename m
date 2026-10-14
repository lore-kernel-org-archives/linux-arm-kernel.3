Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FE6CC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGqY9OeuSuI0aEthSsiU7JsrWFGKoAcXGOm0ksXcQTg=; b=I00/SCgZ6MVUSUGB+bHhhIJI5r
	iNlHH+S/fpTRuzOZKw3QnZuxX6pUX68qYCdUpSoSTkSV4xffb0cQTIY79MP/zvssFQFRBLQqqAMK1
	0LOMnDC9YuxPwn+0CAA+GbSjXTMWo67J/K1WbDjZk3yU5ZGWwORk5gSOlizwm2f00VZUY7t9fJ4dd
	0UfVAkPijX1aSstpB72ZZq1nNuCrhD9eOt6l1ai1QjurRgf/l7uppajFQoOs0TxhDS75g5+7K7L2L
	qsSo+gzYGf/B1/nz6aKq95I1WEY3luEHT/bcOo43WiqF41kUl3Zf2rRzWDEdQhYDaA0DtAe3BHWRg
	IRihAv+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGta1-0000000EmZ9-447x;
	Wed, 14 Oct 2026 07:39:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGta0-0000000EmYo-0wR8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:39:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 94ABF43F74
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 07:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7371F00893
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 07:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791963555;
	bh=OGqY9OeuSuI0aEthSsiU7JsrWFGKoAcXGOm0ksXcQTg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WqRkRRomO92WDiOUWic+S1zHuVNhXsWSqhTlNhkdarMyTWSgdXSEKVpoFMKUT4usk
	 XUv8PpKBAUMM6AJl2xktCaqgYC12xkTJQvFn2v1THERUM0W2tXYkba4Lj55kBYj+Ac
	 5C87fGKNhL860wPdWdqDtVbLoFUeD6toPIMc+3HvWKQ7FLIYZ/mT3jF4egkVCKG0QG
	 WJ5YQV/oeau4uugnNfeKQz+6SSDba1pMWUsneUuVr1skiU3ju4hzL204tnmnoRmMli
	 oP7bX8upeOJAIr0OXqet5ynKIT3t3G5P5h3DXO0ebIzteQGtw+Havul+HG0PZwtiN7
	 TCW9BfnBWh49Q==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a7754c2471so33363671fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:39:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxtEpS1uVni55jutwOnTLJ4oVcS5nByVCV0phGKpavrMILFVF4VyRDIsbuBrosG/5nBzUIQx+qyRmLZ8tcxi6an@lists.infradead.org
X-Gm-Message-State: AFq9FYLi2EXEgJ/BLI3aiGg11k5DJCt7Kar61aMKUfFYpiM/uJW5Zgwy
	x0o5wU0qxoNUvmZcfXKex4y64Dgou2ubVT8WGy+fnvXvwQ4WbmJjZKRzahERFlaLpTTxAxY1FqZ
	HrwWfs6uxCM57ZguqBAFGoiIb9F9wFN3sZrFLDim4Xg==
X-Received: by 2002:a05:6512:401e:b0:5b8:ef11:922d with SMTP id
 2adb3069b0e04-5bcde6cae88mr4673476e87.39.1791963554104; Wed, 14 Oct 2026
 00:39:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 00:39:12 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 00:39:12 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <5e221ba3-fea2-4663-80a9-94fdd5135e89@kernel.org>
MIME-Version: 1.0
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
 <20261013-qce-fix-self-tests-v10-14-57162a38a554@oss.qualcomm.com> <5e221ba3-fea2-4663-80a9-94fdd5135e89@kernel.org>
Date: Wed, 14 Oct 2026 00:39:12 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdqwrTGVtnZuVUsn8onTMxxhbysVfUPtmABL2a1Avd2_A@mail.gmail.com>
X-Gm-Features: AclHuK_y_qSg5r7k-9srjbMx_1U4_7rx7a-kKL338uumbIkGOujVoeMBFDNQ3IU
Message-ID: <CAMRc=MdqwrTGVtnZuVUsn8onTMxxhbysVfUPtmABL2a1Avd2_A@mail.gmail.com>
Subject: Re: [PATCH v10 14/14] arm: multi_v7_defconfig: enable the Qualcomm
 Crypto Engine core driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 14 Oct 2026 08:19:23 +0200, Krzysztof Kozlowski <krzk@kernel.org> said:
> On 13/10/2026 11:57, Bartosz Golaszewski wrote:
>> The QCE core driver should be enabled by default as it binds to the qce
>> device node and scales down the interconnects if no child auxiliary
>> driver is using the IP. Add it to the multi_v7_defconfig. Disable the
>> crypto part of the driver by default.
>
> Missing use case/hardware (see maintainer profile).
>
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>
> Drop fake tests. You cannot execute defconfig on the device.
>

Ah, dang it. Sorry, didn't verify b4's actions.

Bart

