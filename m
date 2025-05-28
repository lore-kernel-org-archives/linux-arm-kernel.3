Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E12AC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLCejufrq+qP3M9mNyL+ruMGCziYJYfpyzwNMPCLUy4=; b=zzEWk6I7GGm9bfSw1aLeaq9N4f
	MzY+esGTCQTVY6kJkVsVbllaCSQtSUdhHpmptp0Lwq5HuS2O/o7mIFkEzT23dSC5jM1ChqknfeJSb
	+8/kMzmVXfX8LWQmja8OzGT8bGfJRvpamXsTNPtvtfJlVmCc5kebVwA0xohnfZ+QPDH/q+k+8HNDl
	qBq8CSIOzE23rrsLIhrsl14wb38P7nDq4E2Om5a/wm3rI/CZ1rOs7WyqSeqL3MdiCxuGb/wuiBhkm
	o6p9vnyIYaWJe9jaL9v/EwxjJiq/oNldBhbMbZ3cdHyZGYAtCNx9U/pDcn3FWgyue34qHk3IqqoLc
	C5V9QQDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHb3-0000000DLjR-22sD;
	Wed, 28 May 2025 14:17:33 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHKS-0000000DJ5h-2kyQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 14:00:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cfe574976so36120635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748440823; x=1749045623; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLCejufrq+qP3M9mNyL+ruMGCziYJYfpyzwNMPCLUy4=;
        b=bri/gz6uI877C/ckLH4B0yYk1HituTnNme6uw1WN+KXDGjYTYYuDx/Y0cQQVGTVBVO
         mjgBBgW/zqYWpxWJHSWnytDB1WCmudA4w3dvxUutNI3d3myN/9UQVlWfbJ+ZMrABJqrY
         Siw11TpEnE29vUd4Kt9NMEptvB4UfPAzIYy6YTxBHL5yYh+yE2U2oXQAnmes2BJhEV0/
         +/leFQU7eIEZ61m3zS9iqRebUX15nGyTU5ltPaTAPzaFYr8ytrEKZr/FkkvmxzEW45Lo
         O6EP0RGCQFJkXxmuZkoXO+GAdQnTbNHHEMZbwbVizj3aEr2RgjHPzXsbcvPzqSQyKSDF
         LEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748440823; x=1749045623;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uLCejufrq+qP3M9mNyL+ruMGCziYJYfpyzwNMPCLUy4=;
        b=b/bJgxug+wcIsU08sA3WQG6e+D8QWV4G1KpK/8ZU19tkw+hPcO/HB1GJqUu4WeKmJd
         uaukWlRVp6A65ZClD85HU9OA7IZ2ZshvYIfUBJbssA2JgmyJJI8Wjt1myTx7UWmR+q/L
         6aFBlqqL3KGhghXxBUvnUFkLix0yVrNDsIuQdeJl3ucyhhX/jbQjkaAXo4effckyiBlW
         kQYiOdar7DjNukaKu4GCaRo6Tw4ia0lDDCNwNxaNLqwwlJZypln1WIhNV/pu0qk4Hr3P
         FUU2MMh5gHR/ohoqroqKDlXrOB7C/24tL+rYtshuxaAv4mPFhXan6z10WSum9nZE7mE4
         kemg==
X-Forwarded-Encrypted: i=1; AJvYcCWVXHIc4YWnffQd/fHNqILOfBO91XPwXe0JRkvMNWQuXQPog6cvXE52u7DPcCtjq8FTP/9nY2E4MX0UZ8POAPXu@lists.infradead.org
X-Gm-Message-State: AOJu0YzKCZh0/XBHEgn+eYJFyBor0RkJmgVOy/HIhCqA9AEO33ubBauU
	bLPGS3kwWWX+0Bx3MLcPsu7c/HSK2koohNiZZbeCP9iIapPRKI6pTq4PwOfqqbonKbk=
X-Gm-Gg: ASbGncug0OeGVqIGVvJ4tGGBZ0yvQBQOyhTXYyHw1HzzTALrZhRcfm7Jd1ljxhkUdVh
	/3JzFBD4CpQl5Zuveu0/oGbxdcd837NO95kqdwx44NGbJj+eTHqujzRvB+6aA+uEG1+1/oXD42g
	cQbaUAeeKyMpx1FCm6NCcBhhyjDzc98IxRcwSrLHgzpAp4kTzCNzg74/LVoumIHumXKixAFZsLH
	4oogs56V9onTIlLtN8HclCs+Ma9zAp/qJf4dC8lEgxbY4XbOGo/v1ZaqAkU6KU5XAaKjuwPQ0Bt
	5FFaoS72JdqiePoi4LwguvtrbovW23jXV/BpBjwfvI0lLYc+I0D7X1DXgOvqPIzm2GCSOWA5VEw
	SQA==
X-Google-Smtp-Source: AGHT+IG4/Cne7nqOIsE/PY37ws2Wr1tDPTEMkErYoJ1bGl8pKJEeVcseVqH5nyS1AL3VO3u2TuUQQA==
X-Received: by 2002:a05:600c:6386:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-45072545b44mr22307925e9.6.1748440822669;
        Wed, 28 May 2025 07:00:22 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064aeb6csm23449655e9.24.2025.05.28.07.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 07:00:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 15:00:21 +0100
Message-Id: <DA7UJKPSD154.2FRUF06DRZO7K@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
 <linux-arm-msm@vger.kernel.org>, <joro@8bytes.org>,
 <iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
 <andersson@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add SM6115 MDSS compatible
X-Mailer: aerc 0.20.0
References: <20250528003118.214093-1-alexey.klimov@linaro.org>
 <ehriorde5zbfoo6b7rzemnzegnwqfdobzwyjra755ynk2me2g6@om6g57n26zbp>
In-Reply-To: <ehriorde5zbfoo6b7rzemnzegnwqfdobzwyjra755ynk2me2g6@om6g57n26zbp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_070024_707643_01CA2886 
X-CRM114-Status: GOOD (  15.68  )
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

On Wed May 28, 2025 at 9:52 AM BST, Dmitry Baryshkov wrote:
> On Wed, May 28, 2025 at 01:31:18AM +0100, Alexey Klimov wrote:
>> Add the SM6115 MDSS compatible to clients compatible list, as it also
>> needs that workaround.
>> Without this workaround, for example, QRB4210 RB2 which is based on
>> SM4250/SM6115 generates a lot of smmu unhandled context faults during
>> boot:
>>=20
>> arm_smmu_context_fault: 116854 callbacks suppressed
>> arm-smmu c600000.iommu: Unhandled context fault: fsr=3D0x402,
>> iova=3D0x5c0ec600, fsynr=3D0x320021, cbfrsynra=3D0x420, cb=3D5
>> arm-smmu c600000.iommu: FSR    =3D 00000402 [Format=3D2 TF], SID=3D0x420
>> arm-smmu c600000.iommu: FSYNR0 =3D 00320021 [S1CBNDX=3D50 PNU PLVL=3D1]
>> arm-smmu c600000.iommu: Unhandled context fault: fsr=3D0x402,
>> iova=3D0x5c0d7800, fsynr=3D0x320021, cbfrsynra=3D0x420, cb=3D5
>> arm-smmu c600000.iommu: FSR    =3D 00000402 [Format=3D2 TF], SID=3D0x420
>>=20
>> and also leads to failed initialisation of lontium lt9611uxc driver
>> and gpu afterwards:
>
> Nit: there is nothing failing the lt9611uxc on its own. binding all MDSS
> components (triggered by lt9611uxc attaching to the DSI bus) produces
> the failure.

Oh, I didn't mean to express that something failed in lt9611uxc itself, I
was just trying to list observed problems.
Apart from hdmi bridge and gpu the failed component will be soundcard drive=
r
since it depends on lt9611uxc.. So, if you have rewording in mind feel free
to suggest it.

Or maybe something like this will look better:
and also failed initialisation of lontium lt9611uxc, gpu and dpu is observe=
d:
  (kernel trace as in the original email)

[..]

>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> I'd also propose:
>
> Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM611=
5")
>
> This way this is going to be fixed for all platforms using display on
> SM6115.

Yes. Thanks. Checkpatch suggested "Fixes" tag but it was unclear when it
started to horribly fail during boot -- sometime around 6.14 or 6.15 cycle.

Best regards,
Alexey

