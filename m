Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AB0C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9tA3tFtTdnt2OcqRFhofQ3tr91DLiJW+I+IyBckjI8=; b=kaw5Ad6drK+BZAeRRGhQHP6ZhA
	2eT/yqPAcN0T2GwicsdRyOGqhfcsF/Cp6vhUqHoo8u2Si/5951cypmB+D5R0mPAA4ksuNsOjd3ARu
	pYavG79ZUyZ1qBLyO+x1sG0vgG0aKetBRh1Rm1EptNd4jIkIluq9ycT/o68qPUYeIafDG9yapyPNR
	H3nwCaWr062XryTJp31c7abB1ogd8fjhblxODIjQFDZgk5tt7auqjNGoOJwvpuxHBj5iXc/v2mx1F
	pImzE/rK+fXDsd2bBOKEo/kSTnxonLxeEBaG3Q9lxrZXvtH6b9pLBrsVYcnfthx/2w6BKLgAlOTSX
	gUlg/T3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEUe-00000008y2b-1zSM;
	Mon, 13 Jul 2026 11:06:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEUb-00000008xzJ-1QKy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:06:34 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DAqxbR668636
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 11:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U9tA3tFtTdnt2OcqRFhofQ3tr91DLiJW+I+IyBckjI8=; b=DI8Z8pG3wdQMwjdq
	NgShZmtTxQEhxFPIhHzG7Y4XzDgWQeVTDEJ8TOU+sxTGh15y8yWG8xKeHQ49dJj1
	e1p0ChIPIxcRutKhsC56jX3fZi9FPHm94PFL2LzrkVexJq/LKYNIMZkY2kKYcSM4
	3SnKeDl8psgTv6f77tztLtl44Iq0WYPTON+OJaMaolB0PJeRapF/1xLuUCtLfzpH
	k7E/XBBdkNABekqxi15zBOSFJJHU/dWX9lSnwoR6piA+mZOqBdO9SRmCmGIEZTod
	aqUbXvFwWjULYAw2EBIt8TtjflJc4IFAv7Sx01pCYRWASjnU3XysIrGW1Z+sCxVP
	RECV1A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm26yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 11:06:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e538afe65so314595885a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783940792; cv=none;
        d=google.com; s=arc-20260327;
        b=gMMo6Jf+kuBBFIMJ6Nkev/eU6D8h7X0C3IvFjtqglFz9IZHiCgcFstXjs7ISJgnyNM
         l/rAgYcpzGVwobf4IRcUiyiOq9JnfBdEb0RwWTxbPLpEV3uXvyDztnc8xIA1iU0agw95
         /wb0dGSOkdRvULZRBBf+FhI6blX+0t/IHVQEW9NBttOlYymlrym3l464lPKR0nLQgAqR
         ykvq733qS9kvBu9GDYpZiu0Gs9oHvfmyB1Hr2alSMIbVCpVQ8Es7YCq0P+HI2aEfx2pS
         bAqcAvrezf7a1q+9tbJDOSti7ALPW9a/o2NS9Cf18hNcxnrMnI6dLQC3ObNlTLsj6kGm
         HGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U9tA3tFtTdnt2OcqRFhofQ3tr91DLiJW+I+IyBckjI8=;
        fh=oSE9ZguEDj8HzLGashcnjv2ulKdBHjUtvVqT9iOQHAg=;
        b=GiJa4GklQJiv8RMPvqWhasY9Y6ioyyYu+L9RyZm0PL6Xi5OgNc3h9sfvzKVQrBwPJq
         IJSOWfp6jUh0mtfDb2vv/fR1LDBME/mht3I5gggVzFXbQRQNmGxH1w/sQBmt6gAED2GY
         H5EIQdlFuTakqZx/hDqVOj6l077k2qGYg6R6jtk2oOu/jBh61nnkdUHT7vjRlGPNvcch
         7Hmnl1F/l9hBtqnxTFCOa+jN5UzQs4L86Q74tBgCPBQlyLzlzM/8ctmKV91gxFckpr7W
         b1blGGO5vggx92+Njq+Va39jIgYY/DUywO4dD0U+AZSABfQva/W9OfLZQiUyKyKtORiX
         7gzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940792; x=1784545592; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U9tA3tFtTdnt2OcqRFhofQ3tr91DLiJW+I+IyBckjI8=;
        b=Gh8pqIMPqto6uxvE7Rpyod+XJ7uM9IsxyuKB2HJUxtoRc0ZQLAwJsZSPot151Kdwtd
         BWqo1umFFjtT4jqkXOl7DjJPwTnoBjLHOgx0WVEIF1M2/g0PuglI2eEM5MiDO81/gYLp
         5cQNopBjlPnAQSxK107gyLi6aHEyhsXH6fqz9X0ZkiYH44LfSO50jhXzgSghOjhljfzq
         HOSKpa/E40s/XuaUt4/S1ulS39Hk3ECLcfvcVWCi/cdxYAKV750awbmbJM2NjL1/GLaE
         MfUICI7Q8/hU866F+59V9wiZVvivjjY33EQ4o00i7qG4Z50itniFSgwJeUu2dR/cBKXZ
         0urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940792; x=1784545592;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9tA3tFtTdnt2OcqRFhofQ3tr91DLiJW+I+IyBckjI8=;
        b=OT4cosOdu/c0tBcK9TZepi8Om8KdowSQZkoLORQNmO263iFjlXDrgq6EhvQATkILEq
         AeKLs6tMxiCrFSWf4j5sc+TKxwxQSGZBFryd1kvjdERy4xQ7cTOiunm6pQVork4m0RK8
         bYp+GSp8Eyrv2PyhalHAXP06hCTp/0JDvHGzPz5TPAFBTxYdIc+8f/j9V/Rhv1/tz0V0
         ChfNd5S0+eAH8jre9dYVLz97D6+1HIgF1XrHWuFc4sNV05mqsI2mZWyjiUIy0R9+u2oC
         ghAHfcthEWl1Yq6j5JW4O97FTKTGRGImjkyQY6Y41/QTw27mkyJbpuF4xJGtJBHymjcI
         p4SQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVdE1IRzAe9SZpTmL25zq1Au56bnMH3mGLOp3AlH6isqP7+D7bL9hVAnjCiV89lgIIslXQ/X1e1P5Xc1RIM8X0@lists.infradead.org
X-Gm-Message-State: AOJu0YzJR6seBYdzNyOEbe3dYvUsjfza8AG/8ezkUAgg1wCS7FJjzkyA
	VjK/oMrYnpgew2Nh9VCFddopa0wTfkWP6LlVtWv2ByAJZT1x8xFqXSRhRLEWfRkZijUgnuEwDq7
	DLFRsBxL1zJAuZvqGlHBRyWdKxvN0e7rzjq9vfw4J9ZieWHpCzrDd595ER2hT8uVhqK/5E841CY
	UlJyPlEln0/RVELgVzMLEgPjrdCnEk4vFcN90T9G0cIao0BdiRtStM
X-Gm-Gg: AfdE7cnEwfBWdZdbYTzTvR06ZaqgANtBsELL4ir+i1veFxyj3QO0YNDmr0HjERaDly8
	QXYKqHu6r8gasz3Mu6qtyQVZiZEKusDtUHiiXYcRw+Mwv4+z9JdechpeaeTc28DPmypOIJgbOxB
	T8V97QQBNATCm+HArr38Mzqfi+M09n/xsXu4hSm39iBBtwoQUgKvDGoUEHRbukQeaDZSqK
X-Received: by 2002:a05:620a:2950:b0:92e:cd78:9244 with SMTP id af79cd13be357-92ef2e26c76mr815024685a.84.1783940791833;
        Mon, 13 Jul 2026 04:06:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2950:b0:92e:cd78:9244 with SMTP id
 af79cd13be357-92ef2e26c76mr815022285a.84.1783940791449; Mon, 13 Jul 2026
 04:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:06:20 +0200
X-Gm-Features: AUfX_myTjQitf9mLWKDNP_7823p7zFAcgW6QTMG2dOgcyWT7UVSwFMCpk7KVrgU
Message-ID: <CAPx+jO-_KLM1Rhu0G=hOx0aLr+XT6X9w9gLui=aHjSBgDkLMoQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] pmdomains: Fixes and add support for HFRP Direct
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        matthias.bgg@gmail.com, nfraprado@collabora.com,
        irving-ch.lin@mediatek.com, macpaul.lin@mediatek.com,
        aford173@gmail.com, mbrugger@suse.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, justin.yeh@mediatek.com,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: KaOJmn8jtAOmd5sYdQmEl9Wd-gtP7yQD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX/tDrsTjPWRtw
 /Mdyr/53VM37zfgw9rRKajtK1npX4cfN9EKRRR1DYW47/1OcFgHbTwZZn7JK6gGQ9lfMwjwisml
 Yp8/XT+W/vL2qL/DwZcjWD2KN91nAuuUn8XW5mTr/d8PT1q/3fsQmeBMouQpQF1kkmmRPSY62sI
 HD3G66Q7tWKv4HXvfZ0HQL9CRmmQLkLkHCH3H7sGxuazZEGna4JugkiWBmYet2SGYeYlapiqvwo
 CtB6qX+PxRhyy3ZqBNnvWnNMXm2Ussy0g9/U6l/kFRT191OxGf/h/+Y6fGLXeQICnqlDN6lOgEp
 IyYPWLRfqvrT9ySbQAfNJ/xLjU+w6C72VuTSartlD0DjYz3xpTr8yQ6qxoJC7tzDEfqT4Ju/9po
 o5mzQl1HY/LROee/3V0chW+Rw5LWbVoDhWWdFTOQLwr14NfJAzsO9yny/IdmsWl+Jru0AoErfAc
 +3Kz1/H9Ay8sCUROYnw==
X-Proofpoint-GUID: KaOJmn8jtAOmd5sYdQmEl9Wd-gtP7yQD
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54c6b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=QX4gbG5DAAAA:8 a=1sG5g2DzjvmgYBam1ucA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfXxnx7NNPKIrc0
 wRhqqohXcJjEzwZBehUU1le75KnowE4FscThIHcq8iDhwIkMuxzaQm46b9ZywfhBYVbAFurfCew
 BLmB1tI/WaSfCDpLEkJiEff4xjAY6u8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040633_405834_765CB48E 
X-CRM114-Status: GOOD (  21.21  )
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

On Thu, Jul 9, 2026 at 10:46=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Changes in v3:
>  - Added new Fixes commit for possible null pointer kp during cleanup
>    of internal on-check
>  - Added proper error state cleanup support for SIMPLE_PWRSEQ domains
>
> Changes in v2:
>  - Fixed return value checking in power off path
>
> This series adds support for the DirectCTL HFRPSYS power domains found
> on the MT8196 SoC (the ones without HW Voter support) and also adds a
> fix to respect the power domain relationships during error cleanup,
> which avoids HW lockups in case probe deferrals in the specific case
> of "almost fully probed" power domains (where most of them probed and
> got set up but a probe deferral happened almost at the end), behavior
> seen on the MT8189 SoC during bringup (but honestly I have no idea how
> are the current ones working fine without this fix...!).
>
> This was tested on MT8173, MT8186, MT8188, MT8189, MT8192, MT8195 and
> also on MT8196, over months of development, both manually and over CI,
> with no regressions detected.
>
>
> AngeloGioacchino Del Regno (5):
>   dt-bindings: power: mediatek: Add support for MT8196 direct HFRP
>   pmdomain: mediatek: Fix possible nullptr KP in HWV cleanup/on-check
>   pmdomain: mediatek: Respect PD relationships during error cleanup
>   pmdomain: mediatek: Add support for Direct CTL simple power sequence
>   pmdomain: mediatek: Add support for MT8196 HFRP DirectCTL domains
>
>  .../power/mediatek,power-controller.yaml      |   1 +
>  drivers/pmdomain/mediatek/mt8196-pm-domains.h |  27 +++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    | 184 ++++++++++++++----
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |   1 +
>  .../dt-bindings/power/mediatek,mt8196-power.h |   4 +
>  5 files changed, 184 insertions(+), 33 deletions(-)
>
> --
> 2.54.0
>

The v3 series applied for next, thanks!

Kind regards
Uffe

