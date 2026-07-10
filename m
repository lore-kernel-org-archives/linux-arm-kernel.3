Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA0CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 18:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYBrJjdKrOKbj3osoG4eQPla9/ybrU/AxjCqhdtwem8=; b=JY4Ew4bpPdJCcHTfuDef9XHxlc
	JU4XQxtK+pTrddoGujSdi7t2ZhRGIXxpLI0U7EfM3LFBGt0GzAP9NSbcgqYEaJgOiPTRHiihAR18v
	B6nejo/vt/GqCsiyBgg0zxk70odDYFx6O1C8JsFJO6oJgS2O37FiIp1nBcC8mAL8NrAnL/fM2YCB5
	wsHZf8WSwvc85M71SQT3FDj6lxNepMAZK+DfU0gyL/RJkWr/7dmAyYmPOYmRNp/1V6Q10iD065ogC
	xw/GHVstrXHD0yEwIv+oX4LlXfsSiGns4o+iDCJrq6g3lyWxKhyz/lK1RE0ICOtsij0YsU3Qhct9t
	OScP5a2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFho-00000005U3x-39L0;
	Fri, 10 Jul 2026 18:12:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFhm-00000005U3b-2aiU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 18:12:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3YFc1453022
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jYBrJjdKrOKbj3osoG4eQPla9/ybrU/AxjCqhdtwem8=; b=MR4lXYnKcyKDNO9o
	6T0eVBHrNaK/eRsohzffKoZ6n0QNhTkuPiDN6941TiDCoqyO877HAXV1FTrsd20L
	GhFiPws43ptjVYdAY2vgj9WFzSAq+xuMzKPr5kSOA3uJlKbjNPwcBXuYGcsYa0qA
	HrJPRWPNITDviy1e+NXKwKc0NB5jFfGT+6XkRx2Lu72cdq3ZnC6p4o5wq6BO0YZF
	e40VW/UKHk0fNyDQiYJzJD9XinzfHKwU49HdE4ebw8wDSOcUMxXpfcvVojY4q2zC
	yhfBFQF2JWlB9XdmUfDZVBVUSlCkkACq+oTQe7o+T43iUbI+wGUb3MM7/cIOZqDy
	xFVYTQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb3xn0f4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:12:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380b630c505so1471159a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 11:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783707124; x=1784311924; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jYBrJjdKrOKbj3osoG4eQPla9/ybrU/AxjCqhdtwem8=;
        b=GicBOj7n0P5sGCRpHKcZTh/4YhA4VFSerc3rZ5/Q+n2kO0Igna9Uko1QTAPNNiriT/
         VnS2fWf1yTDIlpOI0BWLAvwiSWMrY3lOUdDx0Gzlewb7rcdzMSuXv1doUfwJd/DwBoLb
         oEJ1f98JC9h8nHffkCGiH7lU9DzRi25dDz374rH72NBxYVtIA+w9zEdNnitKjmbTSPle
         gLkt2/legtyHUjMKxFb7MA+LixNtHnuql2qVPoUkKWVNF+buJ/7bKFeUiwnJ8vXqfR6X
         GiSKoaDkbjhLRN79UvMu+AF+9B1UbCQxHAYeJ73PiEphLfrSkAx4yodxYLc2DW6mq+MB
         mSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783707124; x=1784311924;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jYBrJjdKrOKbj3osoG4eQPla9/ybrU/AxjCqhdtwem8=;
        b=S3JMHAU9TdZvnwQTRJjXZPbwCHpNEoagEvc3Lw0afOW7pi3hqrQd6sUpHPtQE9Dzqn
         GD/KvaG4k7oXeNFFf3GOIBsohpVhpsvwygQrnWzQQ/jAuFPbqF/ElAothWVLBKAuhqtR
         +Ue1duZski/CBKjpT1ooTeDgy+QgA85g4FHiOOjYqz/dLZELwf4R4LyaUs4IEDi+U8BF
         6heP1dAxBnKUVncgJHiJPjx9MJ+gycrb3gLJb6VrzmVp+c2iZywiE1jIWxoJbDVlmZwv
         CKehyJgB5d4ojB7WJWsdz5cN0A6EHuj3p3m08ar/QVQk7NCs0UKY/D+CcadxOqmx/brB
         rCOg==
X-Forwarded-Encrypted: i=1; AHgh+RrH/qgiIxCWOVM7PynGez5Zu2l2P/FpXrpfkYNrOltno9yIAWP6arVnAZjvj59e54OLaLLbcOKcWEWp1YgvLvkr@lists.infradead.org
X-Gm-Message-State: AOJu0YycRkBJK2EziR/H9LI9sWWI+yp6ymsTkJNo9miJ4xDDc6LCFcUJ
	qmMfQrxEfeTm/4oLGMCe7jitkLG7xC8UKTnNNbcllWfK5GDJJkK8CLxhqnKasqBaicIjYvK/X4z
	7/wxr1PJ1I5iJ/SUzgSS+jRQ9Dqj6af/vrmLpCPXw653z+P1pmi1GZSc4btX+XtXO0NibOPvZU6
	Ye5Q==
X-Gm-Gg: AfdE7cl9ci32Kf5z9EjMWZDPd9UYPzuE7Zbg2F/ZR6QZIphm4krQkwru6PM5872dUpK
	no67e+69a3LkCHvjkWN1ESrZTmGw2eMY9YPjIBVwXYzC/5eUtcoxpaPpi9TEKO6704Nj8gqRyoU
	v3aIFDKWdDjwBI5qMCbZ5pjbEjCiliH8IVSLMIsLtI4kFJXix4nz99ShILt2NNdm0IH2+REZ4ir
	68GpqBXpEgYb83p/iBMjUwNwOMX5sDYibrmNX8v87QPgeA/QM+pthKHVQjinLNvuc0FVmez0C47
	wyWHJZd5Dy0D+8LMl/qDj7Au70bYJO1pLJzPPxBa5/bdpVGMGHz0JzJb+IkOm9RUZzP87MU8MN9
	EDwJe4ZHdjqwDcbbm25kTd+ka8D+Jr5Y4tPBb
X-Received: by 2002:a17:90b:4ed0:b0:37f:bfd6:8b40 with SMTP id 98e67ed59e1d1-38dc74c25d3mr94875a91.5.1783707124423;
        Fri, 10 Jul 2026 11:12:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4ed0:b0:37f:bfd6:8b40 with SMTP id 98e67ed59e1d1-38dc74c25d3mr94846a91.5.1783707123891;
        Fri, 10 Jul 2026 11:12:03 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm41239927eec.18.2026.07.10.11.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:12:03 -0700 (PDT)
Date: Fri, 10 Jul 2026 11:11:59 -0700
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
Subject: Re: [PATCH v3 01/16] arm_mpam: let low level MSC read accessors
 return an error
Message-ID: <20260710111159.00001367@oss.qualcomm.com>
In-Reply-To: <20260710144520.917375-2-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
	<20260710144520.917375-2-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JJYLdcKb c=1 sm=1 tr=0 ts=6a5135f5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=q567kdKukifiGPTRiikA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: GP32MSfS9hip0LeCBZ3YYu085brP1eac
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE4MiBTYWx0ZWRfXxUTf5fiswgiT
 utSCxXaJWGG2kJ3pEHlQokWrRT9phg04wlyC6h4t29klbO8PaRWVYUlnSzgQcZRcvC83GNHkdc6
 pWG0l6XOzB/a4st9jE70JZsL7mfI0xg=
X-Proofpoint-GUID: GP32MSfS9hip0LeCBZ3YYu085brP1eac
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE4MiBTYWx0ZWRfX/0vrJzYSL/Ah
 D2Lbf6AUkpETnhDkKyElHP/q2+yvJeXmfrb3DZ4tOErGlwHxFbunn7imftUJNGmAIrskNfhyTH3
 K+HgNGJ6QVSKcSSFnciAtV7BCoeRfJw8KULqAfI/empXjqf7fdiOvbqXSe7oq7hz/DjvBJT2ByW
 QOGhUIEDcJyuVhwiNTweGHTcTHlyREyDV1/IxbAn710kUWtCVRsiDZyyDrCfyNA6BH9ootLNjxh
 mAEpYjB/VZZKGIteGdTNMRSS59KWorCCT6ieeiGLWmOgGwVLwtZK3Cj+jrJCe1oA+uZkYX8I8n1
 2Ejxr3yGhu21TBBHqEqwafbSlQRuURHMGQ/6Bs7cOwYR61NEFS/ITXBnYM4zQx4TAFlsDM3pt66
 TNSoq3fKXryZuq76AQD/4LlRjHXH2Nhnfem9yulazrW8+JHfMipbDGtMclX7Jxtg4g0l9c0wwv4
 b1wzw4VdIDx5JUhBn4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1011 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_111206_679189_04E51C8C 
X-CRM114-Status: GOOD (  24.73  )
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

On Fri, 10 Jul 2026 16:45:05 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> The upcoming MPAM-Fb support does not use MMIO primitives to access an
> MSC, but employs a shared-memory/doorbell based firmware protocol.
> Its complexity means that is must be able to handle errors, whereas we
> always assume an MSC access succeeds today.
> 
> Change the __mpam_read_reg() low level accessor function to return the
> requested data through a pointer, and return an error code instead.
> At the moment this is always 0, but this will change with alternative
> MSC access methods.
> Change all users of those MSC read wrappers to comply with the new
> prototype, though at the moment without propagating any errors.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Why do it in this order? It seems like it is a path for some code churn 
from patch to path.  If you started at the outermost calls and
worked in adding error handling at each layer, you wouldn't end up with
the change here to add the parameter, then the same lines changed again
to stash the new return value. Those lines would change just once.
Maybe I'm wrong though and it ends up even messier.

Or as you suggest, maybe just squash the patches, which will also
remove the churn.

Jonathan

> @@ -226,10 +230,11 @@ static inline void _mpam_write_monsel_reg(struct mpam_msc *msc, u16 reg, u32 val
>  
>  static bool mpam_msc_check_aidr(struct mpam_msc *msc)
>  {
> -	u32 aidr = __mpam_read_reg(msc, MPAMF_AIDR);
> -	u32 major = FIELD_GET(MPAMF_AIDR_ARCH_MAJOR_REV, aidr);
> -	u32 minor = FIELD_GET(MPAMF_AIDR_ARCH_MINOR_REV, aidr);
> +	u32 aidr, major, minor;
>  
> +	__mpam_read_reg(msc, MPAMF_AIDR, &aidr);

This will need updating to handle the error.  If you were to instead do
the patches in the opposite order. So add return value to the outer
most calls that is always 0 then work your way in it should end up
as a fair bit less code churn.

That update is in a later patch.

> +	major = FIELD_GET(MPAMF_AIDR_ARCH_MAJOR_REV, aidr);
> +	minor = FIELD_GET(MPAMF_AIDR_ARCH_MINOR_REV, aidr);
>  	/*
>  	 * v0.0 and >v2.x aren't supported, but anything else should be backward
>  	 * compatible to v0.1 or v1.0.

