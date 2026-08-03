Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4475C55196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 22:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZ80AOwZ+2hx6l5a4gRP6Wc1xQDrMzv5eF1oL8ozawI=; b=3j685kHScS0PwkrSrfE4I5eoAt
	nGN2IIXSevHZ3wbtWn1bcrxKpmcQvBviEguafsywn0SO7OYXuBiIZakh87sx4EQ1SqkNETun4I9sw
	uUpWz6aZYGS3trHaGmIPENQbbJ0ChWx+Chi2rr3Rdpjq11uA6j/3U/WmmNaQTvo/B1sMgHJAwe5Cl
	byE0yjj3GGa3jxmnKGHWDaI/LVNs21WEfdoIZ/dOsm1fC9h/mGcotlOcqptPoxWbRorzfvyMJ2rTE
	f1hF0NdU0mMr4vQsOQfjOxINyastROj4Xjw43Dd6OcVdptKo6KQFqbda2/KAk/hld0Z5GWuJs6C/o
	TlX/2E5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr19h-00000000b9L-3ysL;
	Mon, 03 Aug 2026 22:29:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr19e-00000000b8t-41UV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 22:29:08 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673K2ao32165672
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 22:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZ80AOwZ+2hx6l5a4gRP6Wc1xQDrMzv5eF1oL8ozawI=; b=PxjIBm1Yq1f01leh
	2aY5HGi0wy6fti4bkHOHYHc5whd32Qf4IKp+R23FwjXaS3dTvagqRLFY9ypn8Do+
	NTopKjNr015QQx6Az9Wix03c2VNUGn85L4s3TGSi6wUpbnSx8nxBKdOntcUgRp4M
	03rNOw6Ao/REOzbBB+7CXbUiotLQzdPWFOBWT/R6kDZbO3tGad7Q2jBFbpbzbNwS
	kdHyIYZdWdrMFOISv8eXMxVwpglN2IHRjmtHpUogXP+EP/exMk6KfIhCyobE5JsC
	Zo/H9rp2oILcAHu/dUxhWRPocFcYT1ZFma99wrJbba6ISyNouGiiO81LqCbBeCqo
	01dXTg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p4rh3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 22:29:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so314377a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 15:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785796145; x=1786400945; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sZ80AOwZ+2hx6l5a4gRP6Wc1xQDrMzv5eF1oL8ozawI=;
        b=YGC19EwDtwKERCWM/I1TlM3Vo2Yjpcu9ayqYSJdeGXjYf8xc7Uoegqfe5JDXJFfV5q
         jTlvHhjuhOQ9KWUMsn6NAaca60lqcD5kxS+PTyaEYFV4fAVvdc/lFV7w1zfw1mFXQFEN
         69xKfTrtpA3z3N11NVVyWScywVdS0mIZ5EVu54v42HXv98DMAUE1HIWgQHontbOJ/17D
         ViOC4AWQb6WUJ1WmOQYJmpAjo1jOMsAA5D2KrVb77zRWYdA71Q2+mEGhtBgSaI8rEBru
         LJQ874RxfPXk45WYlCXmCBIBkVDIOFpofmY0w9CgMsnBCMv6bMd19BbFOHRQ9YQ7fwPk
         MN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785796145; x=1786400945;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZ80AOwZ+2hx6l5a4gRP6Wc1xQDrMzv5eF1oL8ozawI=;
        b=fAxINkpLQ2ajFGKDJspRvnAKsje0hd5vhSDQH4Yv/Q1pMwCAGwG9Yhw3nDaYkpGJzT
         QnmzO4EOJoVC50RIxR3SubzVsGTgQY50qSX1R+f9fMvPKor7HTDEajM55QY57KvynBWM
         pGWhsyCEbnsmYVMWV78eaEG4nMpY6Fwks1Je3y2VxASuBWCjzyAK+NteoBEJ+JM6QPHn
         rWkU743dKK68McTaKbUvJJT9LMfUpVvPIjwMBbT/mwI5m3djjx/1+lMCNdAKknXpWeYP
         SszKYV+iUcnb21knk7iqUJNvNeF/ZYQorj9jl1qNOfaQI6njuR00LwiiFc3JXr2INq4l
         TLwg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2AAaKonvgBOp0iNziD4VNEbMFS0bApGoN/vCkTNLwc6AlSkTltgnsRRg/3UVo0j4xVJxdd/XAWkGR5aeUnuqA@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs/2YtTmcsgbEkp0sPy+gjleCcCzqkAgb7w8pQPEvUfUhqMnH5
	RpyWaDkYGHw5I0D2oW3NB4OrYabSS8yDmy+KoUYS2ryHxoQ8wqiB/Lw36kQswNBnSN/OVVWsE+v
	dt9TXy5Clt0QE4AmkKbS0yXvSRC2wuiTrrzsvWIOVkOOZmAhiKySldmw52NqxiRjdaRGUI5M9KD
	yr4g==
X-Gm-Gg: AR+sD11zSKZgRnyZpFj+VyuhPppg+Ujl51lLXfdtkW6J0TlCUhZxFpe6xZhgeZrHPVI
	Wg7h01dv1NwxaCoMYWKhjAUU7D4KB0lNjg61TDXQxUqw9kqVjO6xZY9UAIZ8zYa5pzfPkfueDec
	7p6pW9gUbxcsINmVal00rf4LRoRt5SqVC91A9bVMliiSHpQ0wxtymqHtyWVXPtMFFbeF8khCEAN
	Bsbqm/L3mQAZjwZuNb+jGgs19BtcU7y0mTAC/EI4IDCpI0y/PbRo6yi94FnLJDnJJaNbWHBiO/o
	6+C9c6dj8t3EpnTW5Phd244iB+CT/6G+77r6mmTQ0YUbMUNWLMR3N7kY6lkR+9LmpU9r/HdEV9C
	13h/AF5dVg8RfOADCSMzJjRUWMg==
X-Received: by 2002:a17:90b:4d05:b0:38e:4f31:8412 with SMTP id 98e67ed59e1d1-38fecc2f007mr1071162a91.11.1785796144761;
        Mon, 03 Aug 2026 15:29:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4d05:b0:38e:4f31:8412 with SMTP id 98e67ed59e1d1-38fecc2f007mr1071121a91.11.1785796144318;
        Mon, 03 Aug 2026 15:29:04 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e44bcsm49863604c88.12.2026.08.03.15.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:29:04 -0700 (PDT)
Date: Mon, 3 Aug 2026 15:28:59 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma
 <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 07/11] arm_mpam: propagate MSC access errors for
 mpam_reprogram_ris_partid()
Message-ID: <20260803152859.00006590@oss.qualcomm.com>
In-Reply-To: <20260731170324.2927758-8-andre.przywara@arm.com>
References: <20260731170324.2927758-1-andre.przywara@arm.com>
	<20260731170324.2927758-8-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a711632 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=_W4zCIwx36R_oyA-FJgA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: rIoJ4XBgnuXNzA514LFi9LczLKe1yjDJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE5NyBTYWx0ZWRfXxIp4MyCdPTAT
 VAC7Ztvtfr/nqSNRlx79J27HZQvtejzXM9QSknK+mIWSCYuHFhs21avTWdClkuzzhbRDBOte8ke
 WGZoKVJiUM7bpnDjLbAATlDwss8A5Wg=
X-Proofpoint-GUID: rIoJ4XBgnuXNzA514LFi9LczLKe1yjDJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE5NyBTYWx0ZWRfX6iFe4gdZQ7wX
 eMvcgMrFOzUQdDvUQeRbjdVEaXyoqW/8Mrmf8xnCZP8MAXvia+4OiEvDb+BsGh55zwzxczr9D2T
 CHWGw+xYtvP7EOwk9lXE5x9h33WEpXBlw0kySn9IePwRwJNzxw0uM1C1ByS54Egv29gTHyBmMEN
 248K7nkz++BThZJwXI7/XoGQ9U8SmYvL5AyJFubEdotjQr8T65ViS9W4gkxNHA4kAp4op1ZtTJn
 RHlb8P1uVUoMg2kUfbc3Munmgh7xLD9wOg62pPjWaVwmnIgA4IRHwScIqYzXG8UkiZMjgqTJKL2
 TyuQ1o0LmTfxEGg6gwcv8RlmN0TwhLAeedac58HPBOysTuyFI7gutDW4FnwRyUAsESoBF8VLvKd
 ZGM2OzW5MfaLK+Xm5/BVSF3QTf9wW8+UyA4YYYOqyALUQ9WeKw6xnMIqE4Yf18RZXAjGd8Gr1sl
 UUTiq78Yndr992tzrcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_152907_010727_5FF40DD2 
X-CRM114-Status: GOOD (  28.45  )
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

On Fri, 31 Jul 2026 19:03:20 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the mpam_reprogram_ris_partid() function check for and return

function to check

> errors, and propagate MSC read and write errors from the lower level up.
> This also covers the callers of this function: mpam_reset_ris() and
> apply_config().
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
One thing below to perhaps modify if you are respinning

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/resctrl/mpam_devices.c | 136 ++++++++++++++++++++++-----------
>  1 file changed, 93 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 38450c55e45e..32088ad1d67e 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1601,7 +1601,7 @@ void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx)
>  	}
>  }
>  
> -static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
> +static int mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
>  {
>  	u32 num_words, msb;
>  	u32 bm = ~0;
> @@ -1610,15 +1610,19 @@ static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
>  	lockdep_assert_held(&msc->part_sel_lock);
>  
>  	if (wd == 0)
> -		return;
> +		return 0;
>  
>  	/*
>  	 * Write all ~0 to all but the last 32bit-word, which may
>  	 * have fewer bits...
>  	 */
>  	num_words = DIV_ROUND_UP(wd, 32);
> -	for (i = 0; i < num_words - 1; i++, reg += sizeof(bm))
> -		__mpam_write_reg(msc, reg, bm);
> +	for (i = 0; i < num_words - 1; i++, reg += sizeof(bm)) {

Not really related to what you are doing here, but if you like you could
reduce the scope of i via

	for (int i = 0;...

as it isn't used outside of this loop.

> +		int ret = __mpam_write_reg(msc, reg, bm);
> +
> +		if (ret)
> +			return ret;
Personally I don't like this style but feel free to ignore as this is
very much a personal taste thing. I'd do
		int ret;

		ret = __mpam_write_reg(msc, reg, bm);
		if (ret)
			return ret;
	}
just to keep the source of error and check for error next to each other.

> +	}



