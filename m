Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C85C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 19:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbI/3Z6Uv0qa6+qosAFvTVjIg/YJF+zx3k1VAkMd4hg=; b=Q5wwEETRo3NRWQ6HCwVPovZ3XU
	PyffOyz65qMMWWWYNyy8q+sU5KPuuMC7fPByBDCL9fwjWsBhRPd5yvqzRNU7AGl3MqnCnqdWIuUM+
	lJ9FS0c1nKRl0nDLRqtOhCpS8VUnAnhsWBfi7SO6ZQY9qdccbqvnPxrj0yUda99XRI6oukiyJQEBg
	SFj8dKIB6X+8s0fiYlNctLBG+VixCSpF+ZuRTShBOMTeCh1AVgA9T0ONg3REFI05RxE1lhlPtBVwH
	j3sS0ykymW/pSbsoP89Ez2apRyG8pi9O5V9FKs6M1eoA6gBMfIpva/wHeNIr25ExHnmDaufmtQ/XG
	cI8QRAgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGUr-00000005ZZL-2Kth;
	Fri, 10 Jul 2026 19:02:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGUp-00000005ZYw-2WQw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 19:02:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH5OJK1407742
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HbI/3Z6Uv0qa6+qosAFvTVjIg/YJF+zx3k1VAkMd4hg=; b=Q8n8HNXAtl5a0NYs
	2v4L3coJYaWCmb3rNaffYnsPrg8b5U6HwUG5pUPuGcB1SSNPhjXCJWCa+R4/tFCO
	MTsAX2/z5YD4rp9dy83CApG+ynJsS+i/g6h73mSeJqnt0u3CLq5TESPQ0BxLcCt+
	QtKdnKuUZ7DieQORjRT7B2v1b/eH3RlgClJQD4kDLY7PcMnT+aZFtY+vA0aSLxVL
	BIQ6nlWCSTdWKn1/9x2tvttdvlVhvZUiqNDLXJhKAkXboNN8u5FeSM/K+Vs9n2xd
	+SrzadYrMMJroREaEELQsse17gT27CtHmbak6hSMuq2GApcwflptMPdy/5wldEY+
	/PCXLw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5fa3ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:02:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8952346bb9so894416a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 12:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783710164; x=1784314964; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HbI/3Z6Uv0qa6+qosAFvTVjIg/YJF+zx3k1VAkMd4hg=;
        b=UwdTNdGUfShPqhd8lDYav1HFN4QQhjWbW4vF69Zrl6iw70q/3UbkHihn5nX1LK4okk
         1fpGMyXKA85r+fu4MKvJdbMEdwj2m7GZoUP0XKzKErFWKNCpZc5qBHe5uY+fB9MNUrbr
         QuanE3ZTSIt7L9OXPSchtzfn6MJzKCpN92DP3yM3JW2EjHcF+gCHgMqUKkjoDCqlvW/Q
         Gn0G6zeJM4VdXZcqaifIwi93m+hcaSs6TGoVbG8potSKB/G7dVWJtnXp/DA2wyfipKqR
         sF+ND6HTA9d+RqqmEHsddkqBREx3791PPcpCfI+eB5zIoNq3dV8895OSWtqyreYgCepi
         HSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783710164; x=1784314964;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbI/3Z6Uv0qa6+qosAFvTVjIg/YJF+zx3k1VAkMd4hg=;
        b=Pf1gkiL3EPfa70MaAFD37AVf50WoFcy9IqAv6a2ty180zy8Pa4fQQH80sNKKtebmLU
         OCrKLi98PM79e9P5ybnSMQ7RSgvHKX+LHwqo4PFT9wrClV4YAzQTduhEgJaAdF7vslr4
         0pPR8U3na78FFEsU2+SICuBS8oaBdxnTUMH86CF1aCxbTFwDRBiHJTMuBpVQda2S4wJY
         LL8Cq07h4pKC5baffgWvpTk4Xdkrk37wFzb2Fh44ST3JcPPK1biBDq6JlvAf488FTwpj
         fx4CaSnVcDl8aF/sobAksfpX0ce3LCtqzjQon1wJjdtjL6WkIVS6Pvw6uLvyqXXVYsJY
         yF0w==
X-Forwarded-Encrypted: i=1; AHgh+RoLMf7Xc36rHSgk9qWgGFCUsOgxN6vRZJrkUJXx1Mat9Q16p7VHXBFI2yO/AHywuqWqlQD9z5nncy9f+L1yWju8@lists.infradead.org
X-Gm-Message-State: AOJu0YzELTgdXRoQQn+y17P8HTiObgOotlbta1z+S5dZEK9eprfKwz9p
	07F1vmpngXHBbvUi4MOypX96Y6NyySZpc89I4Gr0xGZhjSZ/mAMFFJ8/eZoxKGT1nthS8Cez2XS
	gcySvRB+Yb2Yr+3e9EJyxz+CqSBf3i+enrgnrrAVfjatPwVLI+U1L7xV07e/4TNAxd8B6UJ1yU9
	0j2A==
X-Gm-Gg: AfdE7cm3LcZej3O5Hln+5SUc95fAOTbGUTuAoFlwX/F+qCC6h5AcsQn0oqkGQhXh/sy
	6b0B2DSolygaxfeeLiROTVXYiAvnBVlTJLSFJqYlN3xYTgcFO2Ztj8Mr3/105uzCpigyj7E6plD
	WBXTLXQT97Zs313HrHCeNNjPsvuM6nCXmEPGqb1q0IGBZctM1VN/jj0W2HUc0RbIBQm/arYCy9e
	vi3964Iijp1dNqN1l0cp3Mw9wXv2pdsp0GQH98wusCLlmZRMJXhVglpSHyBu0TX3c0pwuCC22nH
	DTLrK+bsZwSCfbxI/U32jbesOY5Bqj2UJdHXrL20CQss8JiuHI4jUk4cGtvED5z+XJjl5cgRDeV
	9lHbDiNdXpaSkwl9rn5bc9A6HIRB4SIADwJaq
X-Received: by 2002:a05:6a20:9f8c:b0:3c0:9c19:659c with SMTP id adf61e73a8af0-3c110b7ba39mr273339637.68.1783710164234;
        Fri, 10 Jul 2026 12:02:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f8c:b0:3c0:9c19:659c with SMTP id adf61e73a8af0-3c110b7ba39mr273287637.68.1783710163656;
        Fri, 10 Jul 2026 12:02:43 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm78063641c88.14.2026.07.10.12.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:02:43 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:02:39 -0700
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
 <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/16] arm_mpam: let low level MSC write accessors
 return an error
Message-ID: <20260710120239.00002f99@oss.qualcomm.com>
In-Reply-To: <20260710144520.917375-10-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
	<20260710144520.917375-10-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a5141d6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=LvQbmhgH5lkxUdBqBIQA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: IfyY1hVZmwInJI0w-r3kTSBr2RPrR8o7
X-Proofpoint-GUID: IfyY1hVZmwInJI0w-r3kTSBr2RPrR8o7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE5MCBTYWx0ZWRfX8Td3SxLX+yOC
 DGcPcy7MOXUI9zfrn46o4LC3Tj5rsNffOOUWJNwRc+Z3oSaTMgr3wqZq/wd8bzjPnAD7Vox44S4
 V2i0C7sJAcRuNhrJKqxF/fuKsSO9VDI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE5MCBTYWx0ZWRfXzkc9YYMpFQC6
 zMvd6cMqS1T7OVKFgakjxnwFKNCTmxZD09xHf5pUv+BF0vy18ef/9k6UDZSRtn3U7DNDNO9cEdG
 VSnMOOjmG5HqYo1oMdwZ0p0SpGBtceJSnDS0sItAp1pbEc2BJUgdxWsx4R9WA95C1oTTFdCqTTS
 iJ4pofNKNY2C4IUdpesAi8gFS7a89t5vOtvCYsXFwVbAE9PoCwtOuHxbgj/iNMDJ4L4ZCb1IVZ9
 le1yKsnIghkPhsachgVl7SxrVJFuMiJjTjZ8qT4ljmY0H9hukt8l7R7PGVh7Y9iA3w4aseEvmln
 CT86btjsQJnct3b6bKTcQZmGB6S+dUn/dpi/op6MZnPWWt7d6SyU2VqDnEsN2z66dSWkSNh39RP
 pfF4jQMfqoMCCbzQgTSkXrtqV78nimsKlk4U1RW+NMmUV0AG6OAQ/A5d9+jDdtKE5NcLuWwJv7b
 NEiMMgOHmUlOzMrQOLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_120247_761489_B9AB4E0A 
X-CRM114-Status: GOOD (  23.61  )
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

On Fri, 10 Jul 2026 16:45:13 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> The upcoming MPAM-Fb support does not use MMIO primitives to access an
> MSC, but employs a shared-memory/doorbell based firmware protocol.
> Its complexity means that is must be able to handle errors, whereas we
> always assume an MSC access succeeds today.
> 
> Change the __mpam_write_reg() low level accessor function to return an
> error code. At the moment this is always 0, but this will change with
> alternative MSC access methods.
> 
> Also change some low level wrappers to propagate the error.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
I mentioned earlier that to me a split of read vs write into different
series of patches is making things more complex than they might be.
They are same 'sort' of change so I'd do them together.

Then a reviewer can quickly see if all new sources of error are
covered.

Thanks (and sorry I didn't look at v2!)

Jonathan

> ---
>  drivers/resctrl/mpam_devices.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index b2ecaba29fcc..f1e40ce24f5a 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -195,18 +195,20 @@ static inline int _mpam_read_partsel_reg(struct mpam_msc *msc, u16 reg,
>  
>  #define mpam_read_partsel_reg(msc, reg, res) _mpam_read_partsel_reg(msc, MPAMF_##reg, res)
>  
> -static void __mpam_write_reg(struct mpam_msc *msc, u16 reg, u32 val)
> +static int __mpam_write_reg(struct mpam_msc *msc, u16 reg, u32 val)
>  {
>  	WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);
>  	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>  
>  	writel_relaxed(val, msc->mapped_hwpage + reg);
> +
> +	return 0;
>  }
>  
> -static inline void _mpam_write_partsel_reg(struct mpam_msc *msc, u16 reg, u32 val)
> +static inline int _mpam_write_partsel_reg(struct mpam_msc *msc, u16 reg, u32 val)
>  {
>  	lockdep_assert_held_once(&msc->part_sel_lock);
> -	__mpam_write_reg(msc, reg, val);
> +	return __mpam_write_reg(msc, reg, val);
>  }
>  
>  #define mpam_write_partsel_reg(msc, reg, val)  _mpam_write_partsel_reg(msc, MPAMCFG_##reg, val)
> @@ -220,10 +222,10 @@ static inline int _mpam_read_monsel_reg(struct mpam_msc *msc, u16 reg,
>  
>  #define mpam_read_monsel_reg(msc, reg, res) _mpam_read_monsel_reg(msc, MSMON_##reg, res)
>  
> -static inline void _mpam_write_monsel_reg(struct mpam_msc *msc, u16 reg, u32 val)
> +static inline int _mpam_write_monsel_reg(struct mpam_msc *msc, u16 reg, u32 val)
>  {
>  	mpam_mon_sel_lock_held(msc);
> -	__mpam_write_reg(msc, reg, val);
> +	return __mpam_write_reg(msc, reg, val);
>  }
>  
>  #define mpam_write_monsel_reg(msc, reg, val)   _mpam_write_monsel_reg(msc, MSMON_##reg, val)


