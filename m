Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A79C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIadBkIMfc92d1GDfpRAdnJ2I4MVADdry9Rz78wXpcI=; b=b+lu8v5jJlL0i20e0oRABzkD3g
	jmuJD4CUtxdMW9neM4otHlbQ63tcURtk5bCPj6O8Re64QPCeKAXvyuYtqPo/F+HEscSxqPpeR5Itz
	2Fs9tbGNugUz6MC8YFOdNMrurKYgTwKLVyzNYO7b2PK/iPhrCTyonHhy4ZvYWTsUrNZzTcaC8bV8O
	vTnYKb6sQMPO6Jgozt7jtHLgSmE6Y2i8HDOTgO7RwXz6V5Xv6MrkbGafT+IlkfTjNXxFx5kKRBOob
	4B773V8gXaHwkY3xWz+UyaDCeXnozvjuuDQLt3apKLnCIcDH1iJ0iO+Zi05ocwMu62RzTx2+/3bcy
	I3QQ8KAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdcy-00000001Zmo-16Zw;
	Fri, 17 Jul 2026 08:09:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdcx-00000001Zmh-1LWV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:08:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E236343D30
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FB51F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784275738;
	bh=dIadBkIMfc92d1GDfpRAdnJ2I4MVADdry9Rz78wXpcI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=SJMJFMal+Qz/rARkuCF+DZhrZzvT9aEH2zlfAfunhCtri3omP3VMqQcqXZArWx5dk
	 FQ4hrHxmR6iSCoIBL5QUbMaXVqRkGZDCMGjEv2toykAa201dMPjp6vVvRmLo2ouonT
	 PQBSXd3WZJCyYzEQOOmfDQ1akkfrXQxbTS4EaRka3dPnP8mfp7Tezb2GHHgh1Eji3T
	 V8oTgLjkF1p/uW23CR10ZjXD20Ml0fw8L4OblvIy0oZLE/2F9RYqiMqfa2ul+ZU8fF
	 Alq83hx0i/bpN7q27cPgT8oFfCZcR1MvJmZLOfOMiGyQDJnqgJJZor3OUdWneyD02c
	 FLO2aGpeCCWKg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b15c6fb864so2479879e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:08:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrmwb+84E3LNgNKdkIQiilA9ACCG37HxFVIifUlj5nzuu0tS1zFIxB/GzNXlU44mPQ+4rj/OisGzUIbKmBFdHr0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm1NVON/v5duFBNhfc0thHNOq+LKOiNMi/rCVH/teoVOm4zofP
	BDK4UU/wE8/hKHttfP+tFYzFX91r5a0iKwUaeIBWcBBF7Tg3piQ6h1AvyDjpjodaofvao5I46/2
	WkVCxXy9CFuHqve9P+xNghN3rvMhO3+52YQjiMZBBkw==
X-Received: by 2002:a05:6512:2524:b0:5ae:baa7:5ed2 with SMTP id
 2adb3069b0e04-5b28fabc53fmr376905e87.63.1784275737391; Fri, 17 Jul 2026
 01:08:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jul 2026 01:08:54 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jul 2026 01:08:54 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <alYGGu7_3G6mJAzQ@linaro.org>
MIME-Version: 1.0
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
 <20260713-qcom-qce-cmd-descr-v21-6-bc2583e18475@oss.qualcomm.com> <alYGGu7_3G6mJAzQ@linaro.org>
Date: Fri, 17 Jul 2026 01:08:54 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdj4n_EodNvdNK31wmiF=av6eqSNuVouPc8d+LFmQHi+w@mail.gmail.com>
X-Gm-Features: AUfX_mx9FEOhptFi_3CRTp4Yaa7L94thQb83JpWfCNZjqAXnfBqalAbWqZfnado
Message-ID: <CAMRc=Mdj4n_EodNvdNK31wmiF=av6eqSNuVouPc8d+LFmQHi+w@mail.gmail.com>
Subject: Re: [PATCH v21 06/14] dmaengine: qcom: bam_dma: add support for BAM locking
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@codeaurora.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

On Tue, 14 Jul 2026 11:49:14 +0200, Stephan Gerhold
<stephan.gerhold@linaro.org> said:
>
>> +
>>  /**
>>   * bam_prep_slave_sg - Prep slave sg transaction
>>   *
>> [...]
>> @@ -802,6 +851,7 @@ static int bam_dma_terminate_all(struct dma_chan *chan)
>>  		}
>>
>>  		vchan_get_all_descriptors(&bchan->vc, &head);
>> +		bchan->bam_locked = false;
>
> I wonder about the implications of this. If the LOCK descriptor was
> already processed, will we cause a deadlock if we never submit the
> UNLOCK descriptor? Or I guess bam_reset_channel() might reset the lock
> as well?
>

There's nothing in the HPG that would imply it but I instrumented a test where
I excercised this situation and QCE was not locked up in any way. If there
were more execution environments doing the same, I'm not sure but this series
was tested by the NAND team and they didn't notice anything.

Bart

