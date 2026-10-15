Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA433CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOFINkoyaoIwUdShZgLDnM7JgCoxlJqF+XqCJgYS6Rg=; b=HA09mnfXctpU8gMAPxDUyIvogU
	HDZZ68aejYIVzvTlDhYYXJLwl4sDsDkpTrbbW21tq4ggg4hzpEoidrCjXRNPZ+w/CiZyD7e++B9rT
	8lxaox07DOPi3PaGdxyL7nyDem1ZgfWPkAOu91QIwGxhnGQfonLD09cCgMJKFAGBrL0z8cOrkArWy
	Xar/w+jxUl8NkIIpMNPhKEd5F7RH82WFLXuZjyR16eKqioINt6F3feTGm4NSchvHag5zhrj0ztIui
	w5iEEWPJ+zaLq6uw3bMZxSLrfzYS9SKfXjEml+HZcu1GKmwKzC/s7ItEF5PnuPviJPyqX3TYo9jT0
	Z0bgdFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKSk-0000000061c-3Yh4;
	Thu, 15 Oct 2026 12:21:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKSi-00000000609-1zUQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:21:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jgMN3510289
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uOFINkoyaoIwUdShZgLDnM7JgCoxlJqF+XqCJgYS6Rg=; b=cUKVqd1Xe51I2+l/
	JkxqpjvowwnZ0Mh7V2dXR43lKe5YBQXPIpP7MuaJ7vlfpNaMoRUPuwv9+s8Wwmz/
	noLlSZcdHmLvd2qOuFzKk+KEsXqL037ylSYh5n66qeqlpPWxbEP9491ZgVT9JmJE
	YUtvDB8R376h6+kFQeiBCy8fnlULXFrMY7EpuPsqn8CPRq0prAqRiWmsjLxfzoii
	IM6piZSFpNPQMX7bP4jlqKYSDxa4+AOFnF8Jz8KpbZF6MtPm0jljtYWMD3TR3woZ
	OmT70xh2jtCszoWZTio4t2lJM1g2BV23SC3rCdNYJfUJN9NLQ0dCVYHx94wZqcV/
	JytFzw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds9y5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:21:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so1113400785a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 05:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792066885; x=1792671685; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uOFINkoyaoIwUdShZgLDnM7JgCoxlJqF+XqCJgYS6Rg=;
        b=BhF/MIdG1XBRwCe+fm5yEih1PAI7ZtqjluXTpS9o15TUQyHG8jilGRF5LH4wMgBpgh
         yN1qV0ktDBg32CtH4pk6dtYxzPXAxurI2sKjNGSv/srj5IpVx3S/wtEP6UTm3EgH1JwX
         j7cpElMr0ZXolgoSWe4lTvBH2x9LM/kCyMF7BS45KJz07IrJiIf7byAu/FRKJtH8yJtt
         6d4ENFk43e13dg8GYFGbmRMBX9RGdBEADViIbERoQBGHAimLDi6ZoqNQEZYc4DSI7sU0
         NrWBLfDNrIHDymYK79mNZoAEM/YgeyAu23L/Y0reb5iUdPscVwjlpuh9eJiaX/Qqzc7D
         G1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066885; x=1792671685;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOFINkoyaoIwUdShZgLDnM7JgCoxlJqF+XqCJgYS6Rg=;
        b=uRP0JOpn0M8ebOPtbu2HKppIJTPnwzSYLEIbZlv8tZvBiKDEb2npWo/X186aPyzyjE
         YlrXliUP6HIksBpt39A+APraB0jTav54SsEpnkuKG5FbbDZEgckzCyw+PIlsvopEkRGe
         sLoEDj22x+LMZ/NJtZLFlob7xe4nOZt7DseEl+IWX+ws73QUT7Igv9H0ykm7GqZlsX+4
         4lOgTweKvya5DoWbuebUEU6U9VAiIuu5lqusopoRyouN9THy1ddyFbNQnFsJBAOs5YGA
         mRQ1ICcvpotipetvUw+eA993ljJ66844YV13YocD2aEpqPedTZ6krCcc+pgJwHUYFbi+
         TrMA==
X-Forwarded-Encrypted: i=1; AKwUvBx85gwA/wtKGaYUVPX1XpBEl68EP0LcifrTgaid9e97AiTyR+zn9zdOk/raiS/2XdWgMX5ouH5Ssd0CYyLzS8my@lists.infradead.org
X-Gm-Message-State: AFq9FYJHNxM1QHinmCdxZ0M3Sn1Ce4RfDISiYXfy+aBoDqLN463x4quk
	ZiAvYUBXD2pfWgPZQvrxkRvYkMhrck4LTz1Wr/0egNiZKw5T2lmxGLRJQUTjberKc9Yz/9C8GRY
	uJQICQlJqvJI5SLaQC8bjx98oAR7OEedEciQYPAPX+j3L6wgl4+5DnfLs8as7yV0svjJZFQ6ube
	+4+g==
X-Gm-Gg: AYBFou3YaumgyoezugtiWnaiIf73sejqmnLjEE75eLJCvhYiaXE5rJ3UqZ80G+c7rRS
	5D3fOI4+R5W/0bgs1/pWsM45RjdspNPrWh4eCAerjemonfQhT2KFm12OvymwGTJ1EQoFdfe9Xcr
	gRqE1p+6p9jqF4NEyU83Q1Gaf8htlQcZELnb5uMLywl0DyZyQnefkFtzv73eMdmFthOKM3NHr76
	wy7UWBXzjh6k7PuFq+i/7m+H5GZbZ+2lV+7xsXqcISIpuk06fz+xdUQaOQXVuP3Sej5fSxPk0Od
	XdsWGTTV1VkMnEnKbdNZz17qguYGOXR8JGiWR2sTuMt+YjNtXaM8dHR8x8QzGdiIc5NiPJZ7c9f
	k8hXdsxEJIzMdrG47dST5L6dq1/s=
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fd with SMTP id af79cd13be357-93ec12c4a90mr2887412085a.74.1792066885317;
        Thu, 15 Oct 2026 05:21:25 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fd with SMTP id af79cd13be357-93ec12c4a90mr2887406885a.74.1792066884748;
        Thu, 15 Oct 2026 05:21:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc5e0asm18551537f8f.50.2026.10.15.05.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:21:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 0/4] gpio: mxc: misc bug fixes
Date: Thu, 15 Oct 2026 14:21:21 +0200
Message-ID: <179206687877.10309.9401675786609225009.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: okLOXySbebFcpufzbsbUJIc1wxeeWWKY
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0c54a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FbT2nVsXUnx1RHKrfWgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OSBTYWx0ZWRfX4AZBxWMfpimM
 +O9UXv1tPpVFKmLd2ukDuTXZzd+8CDWR/gTtwUC78IZSpSaRfGjzGr62XfDnB5X5BfQo2fJhP62
 +KK82lK4Lwi/d02QIKtXbi2zZA7gWa+6LKyrGiQF0CMiyQkAPRJm4EjN4W6gNkuaqUoD34EMKc6
 /e3j2YPsmzBHz1yTPQhONe0uw+U9Cj5mjiFda3dh7KLpQDoxxQapGja6LMXZ22Oaw54bpUHQiAM
 c5EDJL6mwiWkdIk8QSc2wrgsSnCBNHwxLpFNF3gIzkp6RQL/KPig7y/EmxrJaugQVZyT4axmxnA
 tkrIjJk2kXiNtIAyczqLaG1rVIH6lbwP1cMppw4zUT2Y+L9FF60lhZFGHNNxaH0QBzXK1AthwVN
 4OQ+QyHJMMYHVvCaJcFQvemYqZ/NPQs8QS+bq0B420aeggjjMM3WExZ3LheTwoCTCoOrnJnkAGJ
 dErzLLnAFSo4f+qWWqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OSBTYWx0ZWRfX3acoASpEbdrD
 7TquZujSwlOlv704YkLYovu1zA3EQWQAphPzcirwcQDAs18KeirtKDt68c672LGx7znVjk/92ur
 tU95MsVt0ofX6YILQZqVvqGCVeo9rH8=
X-Proofpoint-GUID: okLOXySbebFcpufzbsbUJIc1wxeeWWKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_052132_638028_1FACD6CD 
X-CRM114-Status: GOOD (  12.15  )
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


On Tue, 13 Oct 2026 14:01:08 +0800, Peng Fan (OSS) wrote:
> This is a subset focusing on bug fixes, that separated from thread [1]
> 
>   1. Fix a race where the chained IRQ handler is installed before the IRQ
>      domain, generic IRQ chip, and port list entry are ready.  An interrupt
>      arriving in that window dereferences port->domain while still NULL
>      (mx3 path) or walks an incomplete list (mx2 path).  Move the handler
>      install after all dependencies are set up.
> 
> [...]

Applied, thanks!

[1/4] gpio: mxc: fix race between chained IRQ handler install and probe completion
      https://git.kernel.org/brgl/c/38d44f78f041ffe60c8e2443b99434a199e7541d
[2/4] gpio: mxc: fix both_edges bit operations
      https://git.kernel.org/brgl/c/b7719c575dec69146f6d537fd616b27083c0cf45
[3/4] gpio: mxc: fix wakeup_pads bit operations
      https://git.kernel.org/brgl/c/170aeff46fb54f41545c85a72aec525aebc79d44
[4/4] gpio: mxc: fix race between gpiochip registration and IRQ domain setup
      https://git.kernel.org/brgl/c/205cccd06e545694754e1bf8d626ea96e742cd8a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

