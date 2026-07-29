Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B8EC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 18:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IB5IgmdZ2AgFFTI+wd22TsO3SWHmh33/Yh0U0TdgPnw=; b=jq1jY5M0O3XBKbnEqzjQoPprk2
	eGyZH5XgQ+b8gKl7kzKsQv+mwuEGLozORuw0swy7OwgbUQFYavDR2JMAOk4euAyJlH1ToumS7rLUQ
	MJpWN86lw47LY1Rj/6WlfIKgw4IU2opAPx2N0YIF3wqUb4E6DBnqOLIVRF0NrAeTBWoxpT0QFoRl1
	H9W+jCV/9naiT59ytTwy7SVaTojnDA7hEMsv+KyYLTpA+WygHzm7wEMf0f4vpNe6rvfC0KA3/uCbl
	eCpW2Y4lwCEwF9sofkdMsRB0KUw2n5/YPrEmSsLc19RFmuSTZ8eqWkPLZNDClDRfOJnw+5FnNfXEB
	NAQzbHwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9Ao-00000008pW1-2vDc;
	Wed, 29 Jul 2026 18:38:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9Am-00000008pVB-3GIm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 18:38:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TIR6S92793972
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 18:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IB5IgmdZ2AgFFTI+wd22TsO3SWHmh33/Yh0U0TdgPnw=; b=IUdFm++d4NUmQswu
	39S7YtjshS+upAZ8BGHmVcIt9JmaSvqcltUOuPSJ/8VnTeMad1ELdRxv30H6IWq2
	agbehCo+HidY7wqwbMVSkooTVdFSO2zVrO7akVmHyY02Q1lM5wQirR0Tugs5HHp1
	O7hTQ7zHtB6QKOQefZonxsL8w5V4XAwCCHDIfcW56j2eG1oCGDgiNpIj5IxBi33D
	W0wKANkZm0CGPJrxe5Nk+88mL7RRNOqq4fhGWQQbJ/IttypCZf56twIqzYy6TcjB
	vfZsFS1vy74z/t6//WOY77yytC3T/Ok0yXsIA+Cbr0SrPyKTu5vBREDBf+V68kIz
	Pc32QQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrcj3q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 18:38:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb835525b13so1608831a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 11:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785350310; x=1785955110; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IB5IgmdZ2AgFFTI+wd22TsO3SWHmh33/Yh0U0TdgPnw=;
        b=g+8I/htCcfdmnF/7Gx8s17WcZhMZkW38LMk1LqwBRAY8yr9fyhCvQ3F0J2IOOGg8Vy
         2LIZ9JE25IM6q61TDLovl21jz1bRRY9/Rx0AYfFweDuxq2iHXTq+j06lB97BmjAzCIEi
         wOqyXvefpzm37yv73Jom53IzbRSNbzhgb2R1kJw8jg/yEaSfQhQye2qkVgUWZwDeVPnj
         qFuEuHWXJf8oiZwxc8Y7CuECPPpi4dHOgZzp/vWtd3X5oRxxY7w1cW1rVe8eIFJh1vpQ
         qHz7rNpZXPNMWQpAUsiMtRlVaFdn5k0q4mc9q1p5NmFaXZGH9LAg1I19ivQPVDvLc7n0
         xk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785350310; x=1785955110;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IB5IgmdZ2AgFFTI+wd22TsO3SWHmh33/Yh0U0TdgPnw=;
        b=GdRRv3VwFWDmEIGH+MuHaru4fhrb+EdCtFITYOkVUXmkFkv/2oeiodMAIT2OanPQGM
         6pXYS7rFCc+CKdS/0xKfUfz2TxXtfZXXdDhqIxNWl+PvGnihAjV0RpJEQLHmt7teSsmb
         +O7BrIRrJOEeed0GzUY3rIe6zagJoG/Bt6auO5vw1CO1b6x5kxCPXB5jQJPm+3biNofK
         18RPLjBrJNjGELa/QPPHMegYmJufLIQp/zA1qzy+/tc5mLaMtCqFuwFZDoMqDRvnMvIc
         qeoZqi79MdVtflfU1Z+JaT+PcldG67JiygG4Hwle/E0q9iyOYlNGTp1H4yi/ieUukr48
         fntQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMj+FKNS9foicdld8x22/wxR34kasldNGdR494nHozFkiTkBavgV3vdNZr2diEhXOpfgoST7ePPwV/QedYN+zP@lists.infradead.org
X-Gm-Message-State: AOJu0YzmZRUJjQRNQQ5ATcyq+3MlYzhDBvLv70GjcxT1qAhSUg/j2SM1
	nlUTIBctpk2RqEl5Ep+Pqxu2J/RDRbiTgwJ7a/d4EM4GUkdbt1aRPdT6SbJaM9qGi89zRMNoRFG
	fum1EFq1R8YN3TgQ2SYc7ge7428TpVAihQbYy5hyZPbYZVlwPOYBDP6ShF3WHOHVZGk2OkvNwNq
	CJ7A==
X-Gm-Gg: AR+sD10QbsHqX/w6C4gPoapoPf+4tf8gw/3vZGmbvuP6BxBOQgRxegaGBY20Tu4Db6y
	0LZ5HVuWD40EDHMsUfh9/+KVAIxQDKXqFaX5Z6iqK40kQJ10azR2V2rOQvLnygyfH30eL9kCXE0
	jutiezZ2mNAf7Zns0s5AayRq0j1xnw+GqtGXPz8v9VJVbl7vyB/iS2AN5i9nwxiwC3QigBlqVix
	nRhgfN1fzdG4tRhyFjalJbsx3r8vUM0EWQcMJwvss63osczaNLFcT1J6WHwCKILp0yVO/NqJeRc
	wQemw5WqJD1dUvqHAL/cv+ETdGJimv8WDp1lWFlXxz2MUzJ+mlVoEn2d1lhVIHY5qY2zvX5AtaE
	RUIvK3cxcUa5ST+J/oxs8xmyW4A==
X-Received: by 2002:a05:6a21:1f83:b0:3c4:3454:38a1 with SMTP id adf61e73a8af0-3c8ba5f7878mr8739583637.58.1785350310532;
        Wed, 29 Jul 2026 11:38:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f83:b0:3c4:3454:38a1 with SMTP id adf61e73a8af0-3c8ba5f7878mr8739565637.58.1785350310099;
        Wed, 29 Jul 2026 11:38:30 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d3250asm11010600eec.20.2026.07.29.11.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 11:38:29 -0700 (PDT)
Date: Wed, 29 Jul 2026 11:38:12 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Yushan Wang <wangyushan12@huawei.com>, will@kernel.org,
        mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, u.kleine-koenig@baylibre.com,
        linuxarm@huawei.com, liuyonglong@huawei.com, prime.zeng@hisilicon.com,
        wangzhou1@hisilicon.com, wuyifan50@huawei.com
Subject: Re: [PATCH 1/3] drivers/perf: hisi: Consolidate uncore PMU cpuhp
 states
Message-ID: <20260729113812.000006fc@oss.qualcomm.com>
In-Reply-To: <18bd7977-c0d2-47c0-aaa4-a787ef935597@arm.com>
References: <20260724025238.3411328-1-wangyushan12@huawei.com>
	<20260724025238.3411328-2-wangyushan12@huawei.com>
	<18bd7977-c0d2-47c0-aaa4-a787ef935597@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kNrkUJroRjmf2tTiX3E1gtGB0dsgsyWG
X-Authority-Analysis: v=2.4 cv=Id+3n2qa c=1 sm=1 tr=0 ts=6a6a48a7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=YgQoG-XJdNmCr4bRT3EA:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: kNrkUJroRjmf2tTiX3E1gtGB0dsgsyWG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE0MyBTYWx0ZWRfX2X3XuWU4UbkL
 cPCzuCZRjdDEVrHDEfwgrrsWI6ODK7aGwzdVBDeTrQ7keIVlx3QKozIUUTXOpUhNMwmvUpnnhME
 +ouGUm2niYQANFtqaOCzRgZObdbIjvI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE0MyBTYWx0ZWRfX8Yi2KWGrylAY
 BgZLrvrQRz/SESwXUFRm3kYYvFcy5s9D6DvC1Z3TJrWQ8CRf9vcz+8fGPZQpwJqBrlQnZE+XQl/
 GV8JtB6+KhfYodpDRwoLVSo149/ihaVlGZEmXNJ0IV8fV3MB7zlfcaFjvI6luxEtTJnynaXB2mR
 PN+mYR8CZ4ls+bbapa1OYSRdHK1WzJIDTgqlc761yIz29Qt//FP0nIejT2gP1p/tF5cAy4Ie18o
 f928T9eqIFIDS1vo8jE9EKeFcBSHyJVyp7MNp3f39bFiSkXG9AuTtTKpKxMw76MXIl+uC+YoO+N
 Q9GOJCgGTGR6oHu7YzCtmrY5a+UKq8iUnlvSOEYE6z2t+BOzkxttwCIwoweAJ5hU2UB9QeUf6Zn
 NpG8pilDtN9PFAY1BXyUGXLYPXJpYRNHqNVr7Ss9knL7v0J9m/ID30r9d2lIj1tREtFpyEYhOlu
 PMRDYXGHwAAxUtdC8jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_113832_938449_6C335C42 
X-CRM114-Status: GOOD (  20.11  )
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

On Mon, 27 Jul 2026 13:41:59 +0100
Robin Murphy <robin.murphy@arm.com> wrote:

> On 24/07/2026 3:52 am, Yushan Wang wrote:
> > Every HiSilicon uncore PMU driver allocates its own static cpuhp state
> > even though they all register identical online/offline callbacks. This
> > wastes slots in the cpuhp state enum and needlessly fragments the
> > hotplug state space.
> > 
> > Move the cpuhp state setup into the shared hisi_uncore_pmu framework:
> > register a single dynamic state (CPUHP_AP_ONLINE_DYN) at framework
> > module init and export it for all HiSilicon uncore PMU drivers to use.
> > Drop the now-unused static CPUHP_AP_PERF_ARM_HISI_* entries from
> > include/linux/cpuhotplug.h.
> > 
> > The L3C PMU driver keeps a private dynamic state because it has its own
> > hotplug callbacks for migrating multiple per-CPU interrupt affinities,
> > but switches from its former static slot to CPUHP_AP_ONLINE_DYN for
> > consistency.
> > 
> > No intended functional changes.
> > 
> > Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> > ---
> >   drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c  | 34 +++---------------
> >   drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 34 +++---------------
> >   drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  | 34 +++---------------
> >   drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c  | 21 +++++------
> >   drivers/perf/hisilicon/hisi_uncore_mn_pmu.c   | 35 ++----------------
> >   drivers/perf/hisilicon/hisi_uncore_noc_pmu.c  | 35 ++----------------
> >   drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   | 34 +++---------------
> >   drivers/perf/hisilicon/hisi_uncore_pmu.c      | 25 +++++++++++++
> >   drivers/perf/hisilicon/hisi_uncore_pmu.h      |  2 ++
> >   drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 34 +++---------------
> >   drivers/perf/hisilicon/hisi_uncore_uc_pmu.c   | 36 ++-----------------
> >   include/linux/cpuhotplug.h                    |  6 ----
> >   12 files changed, 67 insertions(+), 263 deletions(-)  
> 
> Neat! Seems like a pretty nice win already, plus it only makes a 
> conversion easier if my generic hotplug idea takes off :)
> 
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Hi Yushan,

Nice indeed.  It always irritated me to see that block of code cut
and paste so often + that it stopped use of module_platform_driver()

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

