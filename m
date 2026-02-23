Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E186E98E13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSAuhEy/wfR8el4QBzajfY3+8FFflOc9RdizmIC3Azw=; b=YusUBsPafMLwaTBjGb8KFscwMX
	OPeFD963jOEmLGHCTxYVEaiS5K6w9UOsO7SyppL0DtnyjdSALauqQDt9dpp21oA8eYbgIBSANj02U
	awySZL3C5QqzVvHYSNshJENVicGjPf9yG++KXvcJNjok9tNKIrT4wdBQ06EYG98mf1RHiztYSQi5N
	UhTLPAYEffbcHU8/HL9Kd2mE0aXh9A17mIW7tWheIYPGKPAvCBd5mD0cL6zVirllL+OCOWBRnU0jA
	wjXDS7ss6fBRg6aF+Ed9awXpB92J0GBycISk2ondkBI4f6aymEr+eYBWNb3IM9RDbaJnDnK5YciFJ
	a3d5xKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSh4-0000000HaqL-2Xe5;
	Mon, 23 Feb 2026 09:57:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSh1-0000000Hapn-3my3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:57:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N98GoL2146284
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oSAuhEy/wfR8el4QBzajfY3+8FFflOc9RdizmIC3Azw=; b=FjRnBuE0nyi8xigr
	mKD48VF2fstEAWo/dknUbGHCHIaKEXCCg1feJbB2JU6deR1hXA5S+flpzqSPzCUT
	Uzmm13HeVtpChsjhSlTV/xhc9itk1Q1YQ8PbcdWfZy9v++2m8NzW9sYWG/i1vF66
	AmcCLOE5M5rBZIufdA2yYe6pZA+p4v0POBCq2859W3uskJXuUkIR3T9OJBFpwxEh
	xc+SFYZcxqshDqejHgI0yYneQGozPIp2gQVanc8whgRk8MNc3VL9IR1yziMpgjD2
	Gm7B4jI267bfrm2i7M4OJAafLg4O83HmrSl6qxi9kdIUcILqAhgwgADc1br9PnAH
	ymRG5A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wyv8pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:57:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70e610242so4163154385a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840649; x=1772445449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSAuhEy/wfR8el4QBzajfY3+8FFflOc9RdizmIC3Azw=;
        b=ArxIJwAYglpOZtzZ2ggrsIPh/bO5xre7nTSbvub4WS2atBmNKMf1oOntE71+pwOwo5
         78vOiIb70X8nwd5IE+Bsvgw3ZYpBdDQotc1Xkq2cSDILDu4lXQGFYk1GDigY4VNOpLlT
         mONKMfO0KH5t2pbMmLU2RSjtnsjAFnPp2XlQvGHK4tOCRiOO3ecCxUNUqDN4ft4H4rzN
         qGFyB3e9HbFRnmx461Yh1Eh8XptIZ9b67MMGwfhzffHGanf3yZYaNxqXH27VKc5NLQEQ
         vfqtNN85/jT8p1JpSBtwgEigUAIurRmq+a7fS6PkxYvlQEZsfVnI0ObHcgzfXSoLxbiT
         2/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840649; x=1772445449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oSAuhEy/wfR8el4QBzajfY3+8FFflOc9RdizmIC3Azw=;
        b=rzP2uzLPt+k/rNteEtNJjq/tNJdMBAKv0A497/hLstKx6ZQB5cv+5EbSmEyI4L4DqM
         fqf8/GT+tiAjcKS4TjOTHmiZgPKkBJWXoCu1872PcRJlUzFfyu33WpJnGhccAcieYLEB
         1GYvAoAOfUftbcGdsSlvv4KfvHqh3+BKcM356cRYAXLpTcjiFePtBBGAL7ikYMiSG86/
         mLjLMX3DZtpj5kIIwPe10CNFI0r7Q4Ptqm6Q4VZLJ3ucfCJPDn7G5hlJ8erfdCh3ppOl
         280bQZH9Aw81dIgUizAR2IsnvRs3OJ9uNNeQl4pKXc22lk3kbs/9hfw/G6uTUXxgaWxc
         eKdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJcjGjavqNapQiC8wvgHPMVALOfSN4/5x58yG92nh3zncmiLPMY2TfWfynzqSidDJ7WJ1GeDOI2vAo9pAvB9x+@lists.infradead.org
X-Gm-Message-State: AOJu0YzLRz5qcU2qZKWqI7edJJE8MHMjrdGgCYoszmGrqjaVnL/IFore
	twFvwSKF10CxdJ2kHOd8tINgslNLzUhI5qtudEma1uYclsXskGpq9559AkIBLmArEjuUFUhkMsZ
	6n3Yv6uKlSg9uKa4ximDep2uf7WzEMuopHZFGenb1IU8/20CuyyNNYvcFs3II9AGNqbZfMR/o74
	kprQ==
X-Gm-Gg: AZuq6aLzVPx14tf3X0f9ZT1QjDx4/jxh2/9Y4mPlCHaU5QRln/M92VLIzmJJ+JW4wec
	0HXeXabLBBzMt8vetrVKqFSlr2PBZFy0Nk4kbsPVNyoE/OWPwacZn4/acjO8ifAAPKLwc/3YtV2
	eEMrT3DxmFuqqgMTgo0HnfJqNb7gnKVBl407MORR8r9P+H6efh2FGqDDEM57SnKhnRmUP/MlAQq
	7rQOczLBuZyZ85UPXgqsA+YC20OwxjghjQ1CDy0D8rO0qzgsKUAtTJ7mJ+I2eYi494V59lJ70Q4
	mKS94xstdgCtuMHeUu/ti27E/pNz1qwBRmCvRZd5s6Hh4YW9C4H6UzHKPRi4t79BMQqOsl69YKx
	pCq2J+TgoFtquYPcVh++qb+w+ZbspgitlzcNn5/QhIpZDzLmuMGc=
X-Received: by 2002:a05:620a:d84:b0:8c6:6e2b:ac1a with SMTP id af79cd13be357-8cb8c9fbef0mr861889685a.28.1771840649197;
        Mon, 23 Feb 2026 01:57:29 -0800 (PST)
X-Received: by 2002:a05:620a:d84:b0:8c6:6e2b:ac1a with SMTP id af79cd13be357-8cb8c9fbef0mr861887485a.28.1771840648741;
        Mon, 23 Feb 2026 01:57:28 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm275752805e9.3.2026.02.23.01.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:57:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Doug Berger <opendmb@gmail.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Christophe Leroy <chleroy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/3] gpio: brcmstb: wake-up interrupt improvements
Date: Mon, 23 Feb 2026 10:57:15 +0100
Message-ID: <177184063423.89486.13285732205335253549.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204164333.1146039-1-florian.fainelli@broadcom.com>
References: <20260204164333.1146039-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfXwDzVcN2vmmxB
 GDIUE7cdZCAeNpjVeESBb7+h7FC1mZjEYhruYsJe1l0ci4qWF5StK6ABiwrjIUFBU6K27eZfh0o
 DDLNzM1uravg176kn5JHYfM89ehDvpnMUKzFWAkrzCMAwbNN7vJ/n1ihzcYvTk1HvBlvr896Yqq
 JhM+pAqXtAQHSpn/je8IhHCRJedPvvJrb+VtmGVZgouDxyX7hKH9qF38JktT+HGeKut+L5kLZ98
 RL8D/NrYsviQNa6fkvQaeczO2zQJcHlhHN8JbCWElp5DfRCL1eCPu5hSGuK/g0COklT6f9w2PLw
 Ks6IaZ8dDwQokPdd7JnoMk56V1L3nroCvOLRBk8Z6+VBaNTMHlDMs4CjB5Vfb4TLbBhq1Tr3ZYG
 NshwbZe6yuMbRk41ZFYKwO6NciAGJYvEXTW7tZektB0nlwSMmp2kjBww4muL/ysouSOih3cBSpr
 SCXcWKJHBwRJ8RRNDJQ==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699c248b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=T0f4Fs0Wa8uatueTJocA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Cp0AvrIzyi9EJlraObFPzS9zgkaeuOfr
X-Proofpoint-ORIG-GUID: Cp0AvrIzyi9EJlraObFPzS9zgkaeuOfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_015731_948761_9831D6F5 
X-CRM114-Status: GOOD (  11.10  )
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


On Wed, 04 Feb 2026 08:43:30 -0800, Florian Fainelli wrote:
> Changes in v5:
> 
> - collected additional Reviewed-by tags
> - utilize irq_hw_number_t in brcmstb_gpio_set_imask()
> - clarified that irq_mask_ack/irq_mask/irq_ack are functions
> 
> Changes in v4:
> 
> [...]

Applied, thanks!

[1/3] gpio: brcmstb: Utilize irqd_to_hwirq(d) instead of d->hwirq
      https://git.kernel.org/brgl/c/5711ae6de0646dcf5bf90cc9d4d7cacd34896472
[2/3] gpio: brcmstb: implement .irq_mask_ack()
      https://git.kernel.org/brgl/c/66ff5094240e6e5cea743f5e656e28734de31f1e
[3/3] gpio: brcmstb: allow parent_irq to wake
      https://git.kernel.org/brgl/c/2c46f19c9adf7634d1eb4ce89a715ca3b0374134

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

