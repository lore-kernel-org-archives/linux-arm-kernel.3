Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4C0C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jmstT2Zeq9ftDIOt+LP0+nqq62lgJGu5YFnVkMj8I8=; b=f8ThaKjDedbbvDrnq5NbhBHKKG
	JK8hN5qpa2Jwkj3GiTaopP5eVSwWpkfAUp63dyrRrYyqw41qkheznj3ctdxA+vYWCsB4hMU25A/r/
	sWLMGoZpEeW5JQzKsteoofxaC+x0MCnIdtGb8cdTaSeopur9/DV26//ObS3vkzbIWETdlaCRnCVxj
	JeMrp6YQhxuOCRpObnljDNDYXYkVn8Bmi0Byvb3kuH3hT3cPdnvLDq2i/JFu4K9cRshCuV3uNoHHb
	Oijts1w/mLQjlaAsgFf2sT15kM3c595MLrZgi5BCOuyU8MWQHHre2f2DRFQewKcfFod4yQHhBuqb1
	r0zOl0RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yP7-00000009b9o-3qY8;
	Tue, 08 Sep 2026 16:10:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yP4-00000009b7n-3RxW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:10:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdeZQ2194523
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 16:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/jmstT2Zeq9ftDIOt+LP0+nqq62lgJGu5YFnVkMj8I8=; b=Wym9qvhx0i9s34Ns
	deiPdGODZSfOch2qfXuQPcigTEkHSNjVMjrz1XahSpCoPP7TTnOysq3lkFQZz4GX
	Hp9N7y0MK9ixz6QUc80mkw+By6sNWwBgt3b54br5DlyM1yUwYYc0o6eWVWPtECbQ
	cVIOxRYoEwPDUDPvkpg2wDO8qYya5Y0hdpuP/KwhB+a3vcHJHE7kJuipfrkr+dt5
	D12/EUqtXotLT2f6sGepK8dMurVGmHP9u5mv1168UdJjBeMicmj6uf8EH4EBrKf+
	6H/U1Wi7OcoMHItVWa6OC62O87oRkRcY48JqzeaJmpT/mDS/Z1wL38k9QYVpdp7g
	WpJBnw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjkshrn0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 16:10:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso62884425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 09:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788883822; cv=none;
        d=google.com; s=arc-20260327;
        b=UJ+++reXuNNY5J8lcjPsomq0w2p3oia/vFfYDSEMOtWQmIlwYUcLYhnpyFMucWbXcu
         AIHz/WoShHZuWDOOrtjx3241Zwpmy2rvsyzCymPlyV6UirLuCc17FVnePQT7kxm+P3zY
         i5XLP0QEJ5OU1XAwABlb6Ui6h0Tzg1YeT6CLFupPaGMDo5LHRzfxc4jVzD0qjo0vtbjU
         /WbeuSXSy1g6DPNLWOT3mAB6p87nEHKR252wLc+KACEx/WGkBjsTTkPASuC4NUk/Plpu
         pv4QacBADg4xEn7PT1U1bpHJfdenHtsbIIxjNQDh1Qy1UBUxgsiuKhYvQyaSEFIrCeze
         +jfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/jmstT2Zeq9ftDIOt+LP0+nqq62lgJGu5YFnVkMj8I8=;
        fh=hCKkreCAcqWjS7ywoytiNjsF8jlfSZo1p2quQof7dXY=;
        b=qkiYEC5e2AzXCf9EJctG88lh6QbHEzETNrmBgEuaWT0k5uWTQEUFj+oVzt9aR1Qza0
         nviv+PHMqHRxh/1DKD6hKTXLDFz3rW0UAIv2rHGGYNVqipvHMtG4/uVBOT8pdmKUv1yJ
         6WYgZygRk1gRtQFSoWmV9fgbAYK7Lw7pOJg17Gf4BtUP5/aYZZaxwFrzAuqI+3ce9+Bl
         cdvSyuiZUFLRigSadBmCTqesBSm2QkqH/ey62fN6OBfUv8Cl2HFePnNQkf0YqoFKsedC
         +Q2aZLLYCAimVEPp0kwz/D9xk1JeO+xY+InqfEi+JqAFAEHjafMp37h5FvyzkN2xmJRN
         j+8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788883822; x=1789488622; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/jmstT2Zeq9ftDIOt+LP0+nqq62lgJGu5YFnVkMj8I8=;
        b=IANX9WqS5z4g3nLBGC7H5vJjGVDd9uSDKkuLK6SVUIYNDwJpO88AOMxh9vLuSnlP8C
         fiQudMNyWSpZ8mD+XV4xWz20403omUDPh4AjXcE4TaGiRmCfS1dhB2SOCaPyr4V5q/GA
         pysxHUab7G2K3jv6PoU3F29/80lD24HKaDW1NUdAncooKkLs6zQ+viMlUPr6uvrX1dZ8
         ZqmMxeWwKqlFcZt2ymarOk3+5kr+mXHGK2TkX1vcfctkrOq8p6ItGZ88SYfWOKiFugCi
         msRl5I+d9CgQPiwdjOQs1eS9EPefbUnIpEl09QHo4427iHQ+xKhJaYdbuAylmADJYjMn
         9g6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883822; x=1789488622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/jmstT2Zeq9ftDIOt+LP0+nqq62lgJGu5YFnVkMj8I8=;
        b=ssiHMK9VP3bySwqwl8gQVgBM8hXsl9/NRGe7sTGGUCaek/lE3haMnk8bpzSl7TscjS
         80+KCi+ms2dIZl7Wav1LVS+P/YRPsmpgXQKeKgAcMpM3zkN6IUkX2rZiecJgoZp4khF0
         JnRcE1KO+XJUEIV7id0kqHG+OwyyqilM54QZtrMvcruZfQF+JO65x5xSnRjt0k522t8s
         rdDqPm7wvGlHrDn8rKB8WYs2NpXjlc8HPNWnkRZqXLvmG79qSjLaZkYltT9CBH1h6yNV
         p/2AlDEepjMX7z+QMtxqs1H/6ItqPYyUV1tiCsvTHrI6G0XUhi2jFkc/tKoQK5peb+1y
         Vd2A==
X-Forwarded-Encrypted: i=1; AKwUvBzFtDGPtZJYtNznDkrbKYB+f22dR72n8aqF3EBm7n23Hye98Sj9G7W3LHlOguAUn+4qRV04mRfrskuTQfe2YhDJ@lists.infradead.org
X-Gm-Message-State: AFuF++kfvdkjpvmtEnu89EPZ67ePjbiWhvxOOB3aZD5MuuZpgrwQscAn
	bjQraG3Wq94+IQtCntEO/abLubBY7GFmx30inxeV3bkbfoKWZvJRBfF0xXCG3fS8PMEltDNOWhi
	omqENYG8tfeqaIeCDXMPqC9TGfbi//QnWSIJUYxKvsuVxy5OgC96QfhJXFMGu4SCE+WKc5JtnME
	mLeW5nrhtX1EG8AO+FMqJavbJXgRDWjEbto0sDdw753Ok9gjziSPDZ
X-Gm-Gg: AYBFou1kv7j4zoxtyDqwnGUeuHQO8MhBcA+e3WvwykCOlMzH1a5I+pa07Ytpu9wFHZX
	jWr9ROhnwnuY/j9Ed5vt7ypOFahluVoT5YMIoYf2sQy8MH54TuYnnlqFzlzuvwz9rVWJwXq7/2/
	P53rKGTmGChDcycwF/WsxMQW1/O2BK+54QZrzVlnYVuhSKOMWfiiiYyooZxA==
X-Received: by 2002:a17:903:1b65:b0:2d3:716e:e2ae with SMTP id d9443c01a7336-2db8d928e3emr2837795ad.6.1788883821920;
        Tue, 08 Sep 2026 09:10:21 -0700 (PDT)
X-Received: by 2002:a17:903:1b65:b0:2d3:716e:e2ae with SMTP id
 d9443c01a7336-2db8d928e3emr2837105ad.6.1788883821531; Tue, 08 Sep 2026
 09:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260813053404.21553-1-phucduc.bui@gmail.com>
In-Reply-To: <20260813053404.21553-1-phucduc.bui@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 18:10:09 +0200
X-Gm-Features: AcwNN1UW4IZJxDfsw72uzKL4GFJXZL8rZaPaQEJwZlE7EQT6AUnNa1eW5qYq8ig
Message-ID: <CAPx+jO9=Jvi0BqzSUSfnY5LXbt8g-00h5pvznL76gOiNzi72JQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mmc: Handle errors from optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Ulf Hansson <ulfh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Stepan Ionichev <sozdayvek@gmail.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
        Osama Abdelkader <osama.abdelkader@gmail.com>,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3NCBTYWx0ZWRfXxpllPdvvoQ2T
 srdh/cglMAp3MvQ4XeKsM0GM5a0fjX1GPo8kCaafFTCDhjazDNIvEyqfbt8OFQNNm6nmJ5sROSx
 vd5MbygvLK6FVDfWEydv4CH/ddwwOIk=
X-Proofpoint-ORIG-GUID: IYRqsQPuvMU0ktfjsGbb9Sl1cZscafO5
X-Authority-Analysis: v=2.4 cv=TammcxQh c=1 sm=1 tr=0 ts=6aa0336e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=tukmojBuO8YyzP4fvAEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: IYRqsQPuvMU0ktfjsGbb9Sl1cZscafO5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3NCBTYWx0ZWRfXwXtNl1jSCltv
 u1jUjMaiC6d61qNJuXVA8H6C9ZgT4wUnfugXQ7rLE3+eimlmt+X8bETfB2t97KLNe+J6rWl9e/w
 8bZTPAESlMC9+nT0l0SCtd4V2xEAH68cttgSRRuHtoTayUvZDJ9bNqMxgklWQeJRL/DHI+Nvn9i
 PbzOd5tOCr7NEWuYWweOX863/rKI9UxNKbGhg69Uc3X2PEOJEOx9xuHJmr2Lzu/X1MsOugY0yAb
 n/E2eRrNB9BTRSiQz3x2LvH95j4+NLat7SgWyaDzIbY4Gb59n5lag6pWwKKA2Sya8sD2UiPccsc
 6yKTRULBRH0evOIumvytjfZgxIBVkQg32UC1WJOdzOC547CYD+CqtIvqP/LZGsqoRrHYd+bsg8D
 0Y5ixTct9iD63TbTILi8uALhuuKQdiHWvyZ40bNTQpHSCacTRb45hmSunccOsTs4cgn//FgfG1c
 OmZb0fAfbSJ/Lp+3v8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_091034_869173_E50A994C 
X-CRM114-Status: GOOD (  20.20  )
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

On Thu, Aug 13, 2026 at 7:34=E2=80=AFAM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Hi all,
>
> This series improves error handling for optional IRQ lookups in several
> MMC drivers.
>
> I noticed that mmc: litex_mmc handles the return value from
> platform_get_irq_optional() correctly, distinguishing the case where an
> optional IRQ is not available from other errors. This series follows the
> same approach in the affected drivers.

The series looks correct to me, but someone should really look into
improving/replacing the platform_get_irq_optional() API. Callers
should not have to check for specific error codes as that is just
prone to problems.

>
> Changes in v2:
>  - Use parse_fail for proper cleanup on IRQ lookup errors.
>  - Initialize cd_irq to -ENXIO.
>
> Best regards,
> Phuc
>
> bui duc phuc (3):
>   mmc: meson-gx: Handle errors from optional IRQ lookup
>   mmc: davinci: Handle errors from optional IRQ lookup
>   mmc: davinci: Handle optional IRQ return value correctly
>
>  drivers/mmc/host/davinci_mmc.c  | 6 +++++-
>  drivers/mmc/host/meson-gx-mmc.c | 9 +++++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> --
> 2.43.0
>

Applied for next, thanks!

Kind regards
Uffe

