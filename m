Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A7EC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 03:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LE+iPHn9D1kZG3rkPluziSGiSGb8UhkNyCDjonqrSQM=; b=k/6eq/UqXdaTSTs/RaiPz9VS9X
	WpV0cL28htlLA2gMaJauky5JE+c22PFgcf1OKPRjP64PeLqS4FsB5VpA6ysnB4CTJ5RAhpHawJPzx
	/0n7K0Zol1X7iZMiROQjCSEGfKOPeIHAOopOwcs5Fu8R/9NTq4/h7udZZnvZa7DEznIP8GE7LKOmu
	73Mt6lNb3n+3wRDFw9EmP2uQ8vp6BKSoPWX/rVkPrbP5wJCQISSTG0nLUZOiLY93/rSA75prOKC8j
	A06Hcrso/fdi3tb68NyVkmoAWtKAupNVcsG3YGiwlN4KBmfxQDAfrZalKxmjfoWglcDZnk7AwzPqI
	KWi3gJWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3PlJ-00000005kbJ-0zM2;
	Mon, 07 Sep 2026 03:11:13 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3PlE-00000005kap-1ZsK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 03:11:12 +0000
X-QQ-mid: esmtpsz11t1788750627t59ff899e
X-QQ-Originating-IP: dv7d05JYBruWzbduOPxHqLJnZMoYK3QjfK71uKOVlKE=
Received: from [10.200.8.55] ( [175.0.204.93])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 11:10:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13353973710952998014
EX-QQ-RecipientCnt: 13
Message-ID: <3480763CC31809EB+b4251e64-96c8-4332-a9b6-592548cb6d54@kylinsec.com.cn>
Date: Mon, 7 Sep 2026 11:08:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: tpdm: initialize spinlock before exposing
 sysfs
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>
Cc: Mao Jinlong <quic_jinlmao@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, jinlong.mao@oss.qualcomm.com,
 qinyungao@kylinsec.com.cn, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jie Gan <jie.gan@oss.qualcomm.com>
References: <8693039B65AA093F+20260825020647.2469-1-dengyingchao@kylinsec.com.cn>
From: yingchao deng <dengyingchao@kylinsec.com.cn>
In-Reply-To: <8693039B65AA093F+20260825020647.2469-1-dengyingchao@kylinsec.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: N0Y11OQjfoyDdaC3tJiGXETljx0gOZIp5bnLPMcsUhAijjBOD3ffKSr+
	8irTmlvssHTuSFA7if+NJd6KD+obVy/YvTzOoi6+HRB3HkRF2cFs9068MnNnrQ5oBaQ0RMm
	ewWcAesptDL1hPSRHqtNyyy729WyYshdnU/mtNTjkKMs+tbd2HNB7rst57WRih717L7CIAu
	AX8+XTRy/EB/QJwzlmebG5TUoM9b/KPNUWrVNNl3/rqpFYwDQEVUh/dmxSyuJ/R5Pek+s/p
	WRVVkXqY37rj0fs5X4Wz577aE2i4RCkxyyvCLQDGzzUWrMTdYO5tXZRfKkEt4ve19kzczlM
	aiI2PTFACD1EhE+7KeeDQDLCiU9IhhI1SlvBUHi76/ihg0JQdnKmUKiM615uc6d61HLOIaA
	fcNqlaUBiW8WVVjbCidnYCuVxcJQaBpEYG5JMuzxUTSomTWigG/B4X/nGh/6Yy+Y51MpwvZ
	1NHB2dIK3ce5vK68jiDZDbtmzObX5isamFrvCmRG/eaexhXgb/+M3nLIpwzskPKPZSUW5Xv
	OU3DLyd+Z7wMhO4DCxDEKMX9EMsA+yh9kKbg4TnLLZHEeZBe/uIYTgNuBDwqszb5fYMjnoc
	7OHhA9PZwmPgIAw9KcIjht62TBuwxF6Had6EbSkDdj/Gbm841V1uMYUp7Qmsl/RfWpdFVFg
	SsnayuG3/o6iOVfFRB6E8go/Xta7QDgiRMGgrrWEOqnXFU6CgkUaSiu1NnmQ72t+ebfGCoa
	NL2B7TmRKz+fJhgUOUOwZHEpeN8HbMoPx5SXMKB+UtPAOSyOPHtDIegqt3wUjO6+0GyyOpA
	3N7/0QLo8Eu1tCRwSG6zwA/ganuZs8q7bRuhyBkPWq9HSEKBxl4z9xcLAwcaIck9i9Y7a4T
	hlkiouP/ZLD4OZ94FyJ0qJgrFAZ9q1MTnfgKfRrInAzqEeUfUQ5dTcP4ZWiQB6glvqrSOe1
	YYZZd851UPfI7kKFwDniwfXsL1NQC2o5L0x32Kz9udJOxbHny2J5SwbuASmHHF+J1dMu9DL
	4Qu0gw2/l4kCyympZZnv6S3HaEYW1TmDrOWCYY12OABwQr6pFwFpTHl7nxXrD5aWM0sb3K4
	eI7Exp3AW8u
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_201111_369512_85231E73 
X-CRM114-Status: GOOD (  14.29  )
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

Gentle reminder

On 25/08/2026 10:06, yingchao wrote:
> From: Yingchao Deng <dengyingchao@kylinsec.com.cn>
>
> tpdm_probe() initializes drvdata->spinlock after coresight_register(), but
> the sysfs attributes registered by coresight_register() use the spinlock.
> This exposes a window where a concurrent sysfs write can lock an
> uninitialized spinlock.
>
> Initialize the spinlock before coresight_register().
>
> Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
> Signed-off-by: Yingchao Deng <dengyingchao@kylinsec.com.cn>
> ---
>   drivers/hwtracing/coresight/coresight-tpdm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 8464edbba2d4..50d1351772b9 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1457,12 +1457,12 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>   		desc.groups = tpdm_attr_grps;
>   	else
>   		desc.groups = static_tpdm_attr_grps;
> +	spin_lock_init(&drvdata->spinlock);
> +
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
>   		return PTR_ERR(drvdata->csdev);
>   
> -	spin_lock_init(&drvdata->spinlock);
> -
>   	return 0;
>   }
>   


