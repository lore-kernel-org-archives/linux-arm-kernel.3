Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11DAE6ADE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 04:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMGxDuJ/rtujDZFX9z6xbz2UE34eujmvFMapxF8n9e8=; b=ik4RExKUGg1ygziB3hWESybRLW
	PiP7AYzXhbO+kWOut2/rRC/lRhy9TZlSJ0lXcwZCAhVCpUU3NVbT3C5M4rBG/daKQqxCybsDSsQGD
	uGVL3HPWU8EsOlHYw8/MV60oCDmcBUk+7GfoVEq4K5DkXjBFlxWj1kbXa8HkCWEjcJRl2JZSfs4TY
	Rmm2KGsEWosj1cYaxWLq0cDI7pu34yzL/hB8nt7UuU3vHdM4hnINmK6yV4ex9BeLx1w1xwBDP8AH8
	H4SeNo1u+GOGywbBQrLwAWWJs6/2rBiLFk6ahkBDQCpFZyBokHNf6a6/hf+L+lA801cqmZEamWt04
	EQbg8Iaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEhqL-00000003khs-40Ii;
	Sat, 23 Nov 2024 04:34:01 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEhpP-00000003kdG-0Wjy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 04:33:04 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53da353eb2eso4699541e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 20:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732336381; x=1732941181; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VMGxDuJ/rtujDZFX9z6xbz2UE34eujmvFMapxF8n9e8=;
        b=eL9P1D2Pk94FUQgWIfAoS4pBHOUxPyIaxAqB7vKfaSypYuYdAgYYsAy3Z00qnFbRIx
         VdsciD6vYbftQbfUiSpoNawGqaj+4pAEdlC9xNKxZdTEdD2xkfFN5ivxRjsgAv6lDaZ6
         ylmq1n/O0H6ZS4g8BZznUe0mhHP0kR654WKqwvSew17+SdTELPsmUJ/SHSHiN1zOWEtn
         6RBPWE7EraJkkEwE6YWOpyIPKuku1yHu6XWd4X4Sve4wObv8m2PTa9CL1PDIn5+/+H65
         ws2KUBuJHKNudynnqPYqEMKD9MjXhR0CHVAy1VFdsygC00HW51Y67nRAYiVSBWQVIXlB
         mwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732336381; x=1732941181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMGxDuJ/rtujDZFX9z6xbz2UE34eujmvFMapxF8n9e8=;
        b=XBsjbtbjnRRFhusVc+QOkDW6bHS8DlnzvlWJL/RcsqdE8pfUo6falHWUqIqyQ02R9B
         lo7xR0aM0cRnKU6fCqTT92U6ehRpmLw2rorRAt9s1EPSSIxmX/LqB7yci9BjsFipJ88R
         8HX66InZhw/OJFZESF5wpuLQCQDB/rQ254Rl8S4bRUzvENqy+Xav32oTp/INhFjZKoUd
         raew4039ggN42tqYkJUBE81UEZ/9MslP+lxmThS33nf4YDylpNvznFolD8epVMf/RV4b
         07IuAmvXwDHXIhem4PSWxQNIe3wQsze5lkvgxwDPtjzEAlZiOK0IblpljjKS+POeUrf5
         Wm9A==
X-Forwarded-Encrypted: i=1; AJvYcCXcU2fJtLt7zAzx3Pfxfp+yMA24bWzNnNnAfUrtuit4pQACsgsm99RUAdh1upbomyWY520J083MZHEPdueyc0km@lists.infradead.org
X-Gm-Message-State: AOJu0YzSfBh5M3CpKgXosrUdqReU3dy6WFLIxU1kB0B7UolRxhDyM5nU
	DWq1NddB18rdCz4VfdKD3PhZdSC1T6rpY+FQbcsGQMMtG/gPHiSZRQQdh3ouRo8=
X-Gm-Gg: ASbGncuC1KXH4Kncmb9ypMQIGXELNa/TZTz5L0mS42xTBG29ettkatNLcoaF2fx+G+U
	WPnL3/EV9wPKPTOzLt1ca3auG7fNKcA2pO+boaH8rCmtPR8zDCuHi/+t8f28Z8FxmcvBRWNvoRi
	vHjkYD6qt4+Ulvc2uhud2sDQCjVIkCmTX3heZn5LQjLtqOBYprmWyoYhTljt+MLmom1p1Wjk5c6
	sybO/rve/EOn5S2cRsiViXzWkeP62wyeWbEuS+H6ydXdbMKjh6mXYYgriFo07n2Uzr4D+g8oILf
	TVVbHj8XQFlHhz+q8JPj3FaGx2vEMA==
X-Google-Smtp-Source: AGHT+IHLJiA6aYnUX3Lh/TeIP5I3J/OMBEcDuDbvten7DOXiFjiEs6Kd2U58RE+IDTcVG4JwRP8PJg==
X-Received: by 2002:a05:6512:3ba2:b0:53d:d0a9:a453 with SMTP id 2adb3069b0e04-53dd389c91bmr4355304e87.31.1732336381130;
        Fri, 22 Nov 2024 20:33:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24513c0sm715018e87.97.2024.11.22.20.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 20:32:59 -0800 (PST)
Date: Sat, 23 Nov 2024 06:32:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v17 5/5] iommu/arm-smmu: add ACTLR data and
 support for qcom_smmu_500
Message-ID: <ppbgnxl5wh4cpkkb2lphealm5cqbdfaxqwizxe2ibrqifat3cu@abmenyqc35vj>
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
 <20241114160721.1527934-6-quic_bibekkum@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114160721.1527934-6-quic_bibekkum@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_203303_173612_DC9FD44D 
X-CRM114-Status: GOOD (  10.92  )
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

On Thu, Nov 14, 2024 at 09:37:21PM +0530, Bibek Kumar Patro wrote:
> Add ACTLR data table for qcom_smmu_500 including
> corresponding data entry and set prefetch value by
> way of a list of compatible strings.
> 
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

