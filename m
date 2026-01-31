Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D400DD61037
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 16:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J50vAf4p6pBlGcfz7i0jIrGJw+GAmstYwfRJL62C4qc=; b=MaNnP8b5g+B3gXiNnNN2f+W4rD
	36YIFncSEO4iL4PsM5a56NYLmBvu5lhabr18xhLVh52Rj3u6tQCKjMBtBJrPEw3gNQsGmHQp5IRTi
	xOpOVek0iI9Y6tHQ7n/PfWPzbRLeuwe6L5reA8AFT4pbnb2PcvO0u8N4RRVFqOwEae27NlfR6yrQY
	GJc9D9Ibtp9z4HqwIg1bcnryMsihSCnMKARg/niCdzyWF2qJd8ZMcgftUoKOSe1ZWJiqlr0j3Z0Q2
	Jknj/U4Y10JNv7B+fZiB4mOsTwj7OErvVoFhXaPf9zmHb0gRmvZUb4SC6S0Rb4W+Qyoa8KUiHyhDG
	FohrVe4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDz5-00000002osU-3wg5;
	Sat, 31 Jan 2026 16:38:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDz3-00000002os5-0uXf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 16:38:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4SeqI1509938
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 16:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J50vAf4p6pBlGcfz7i0jIrGJ
	w+GAmstYwfRJL62C4qc=; b=g4++Jq9iWAPk3s6pcZPMglEaYIh5vVQ17pyXSuVJ
	nMytMkfzHNqJZFXZBl02yusZX//QuRM/j9X3gRWf0TL8etmKhWqVloCjgeXj1R82
	/Im9SfNapYLWXeS6zCo8kmW7SBNuJiovBMo/mCaN7MceJ+ciko9CudXzPez6t0Kw
	5Uoo1nVp+PUG2fu6YT4BFSOlhxn/ptIZ3mFfwlTiw3hcMsg5LPQ01dni4s4boNu/
	dZLmR18JlOu7X0kBs2D/FdFpXX/kvnFMpURN2E6QtC9wmnUdrYRuaZZZHiuRwvRD
	V842pUfJUr06E7OLLCsVTBHO9FMvJ5tisfW7M5vjswmAzg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard151v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 16:38:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c551e6fe4b4so1964315a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 08:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769877482; x=1770482282; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J50vAf4p6pBlGcfz7i0jIrGJw+GAmstYwfRJL62C4qc=;
        b=klvpvJL2bRVS3EYQMuG9TT/x/YK22q5+SqVtG3lqli0/RIAjJDStGdy9l+V3DEvmQd
         DRzp9eCyU3rGjhg1yz3SOCeFN5hnsPF7yIj74YR3VP/uGdUbXOzhr0EdGu8FokD6ZZuv
         XU+HP07B4M92b47/7WO495HV2N5g1VBiBtXzR7bmVZHG+FWS4R7GhpMuI1urZUKTSvNZ
         fFT87pnkGxHT/341XcTpOezIH98HfHdynF0ZIetr6MfK0HkW5q9zzN0uCfK0fcDJp1P1
         u51Pcv9TVVnxSd4xDvtvmXfF8+fVP8mz+hQceI4GC4Cuu7YV7V37FxaSoawVG30+dk6N
         5vSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769877482; x=1770482282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J50vAf4p6pBlGcfz7i0jIrGJw+GAmstYwfRJL62C4qc=;
        b=mUMDhK7ogIk0iCCG2lPcKuIZPWts7n2HmRSzyRr6wCdweL7a+2th3dmssii7sp2VDs
         /DzcMpTAsIXhUSuwYIS0OadZD0/f8FdckUzUncHu10W2oVGknCnjMUpg9QWzRoFq5fqZ
         +Q/raWp9awkiv35l3ehP9WfBzUrioVm7YJi9ORzaZfN4ZPmC7cQkQ21lzdTC5jLgh4t4
         QQ1O9Bq446foL5zApmjNxpAw7fWPpjfqk6tNOITduydD+k/3Q36lNm1XR+lmIaIgMf+f
         B2bkOpfToTPpQJAEMfaORgnNCWZakH9Ow2hOCcMtfAKSkIDPOvB4mtp6YBvX122G7F4I
         zzwA==
X-Forwarded-Encrypted: i=1; AJvYcCWkctAurMd7JTtxQwX++wDByaw6mdXFhlKXvfFvjZGZdR+QSggBcIXN39fqCjtA/x4gUxIFAAo7U285Zuz4NFMC@lists.infradead.org
X-Gm-Message-State: AOJu0YyFjBnwPL4ApfLm1MJqDnAzoEdCGTjfRVhdeDSPwiMXce0d5zHr
	QLmboAAIDfV1whzao7Ay5lUJMZ3GCNhts+3Beyt0vOp1fsi0wRSYVtXKQdEn53hhQ44IWwcfosb
	TUUVnNxu022xcyrUEr6k9OWVY7HjMYpfCy6Bj6/XgvZ0iraMWLPSiXHjHyEdaQ0wfHAnVwsptSZ
	OnJQ==
X-Gm-Gg: AZuq6aJzjy+dE7dQQWihqnncI9+PuleI7lJJ7V3WXMm5rID2zylReERjAmcDiTUdkfy
	CElLc/02TtslKd3r9JclWyzca1QH3QPkYDr5Ga2xG6gQurWT42rBd8nBl5wkBInJXx/xfUAQUwd
	8z1GBOd/d+tkG8CnndqDWLG39ogguZWG57AwVRCN6UU2SJDma5VMN46EeWa4CYQfMojtMBh9hCU
	uvdnviL85WyX1+8pXfHkHhHfBFpj4lTZwWUIn2f3GN73vJJ6XjFfARCWh9cgbBgdyx79nqa2lUh
	HS3ALR0DynDRclXzLgzQmiOFZAguecWMS6sXc0nAdg1FoSe27TSZBk8bjTSVUGBJcnlPJt3GkiJ
	08rTioxGFlIuCdlvtDZHLKTU=
X-Received: by 2002:a05:6a20:a11d:b0:38e:5535:bb4a with SMTP id adf61e73a8af0-392e0012363mr6614252637.11.1769877482158;
        Sat, 31 Jan 2026 08:38:02 -0800 (PST)
X-Received: by 2002:a05:6a20:a11d:b0:38e:5535:bb4a with SMTP id adf61e73a8af0-392e0012363mr6614233637.11.1769877481572;
        Sat, 31 Jan 2026 08:38:01 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c64276ef9fcsm10392441a12.1.2026.01.31.08.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 08:38:01 -0800 (PST)
Date: Sat, 31 Jan 2026 22:07:55 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 0/3] net: stmmac: pcs preparation
Message-ID: <aX4v499Zz0CymZI5@oss.qualcomm.com>
References: <aXyRlFw7ZuhRPiKo@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXyRlFw7ZuhRPiKo@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDEzOSBTYWx0ZWRfX1LWwDuHkcRBj
 G6MBMCXtIlTxr5wyWTdzjE09f55mIc9P/fsxjfBhBPZt73jCZPEjL1uPWom3dDONTo7MMGXtXct
 sdBTMaXTkm/dP7ij5xUGfJzo7xyIyQn8WF0D7F+BKcjABMlkH0ow2P6vHgc/x1je8KCEvvph/lS
 MrQDCJMc8vsqBUkdQazD/SRWI5sLksLWp9yFV5CArZUwKyfhTKrbxrY0fVoFFQe+9g8E5NTWu5M
 fW9p3pyImn06r78bSHWdZ3E+tWbP/yJUXN6Jipy6RT71xWmbbQubMhCQ4c/FNB4R5AvKR/C2Gns
 WSlQSf8HZLiR27f8MQT7BIS/oWRVQAqDZi74SN0gMpfU4KzyrINtX6+V9+3O02NEDu0WTEDZXHp
 DnV1A+OIUTd5GDbewIrrvFQHVXxYSxpbuNjOP6OuaoN+f0ZLQjHEk/v0yurhANNkRVB1SNfMnnr
 7seXK38uaD2+e67srmQ==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=697e2feb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TRWK8DKzUZuuTiZSCyoA:9
 a=CjuIK1q_8ugA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: E_D4lqwunPmPcdlGQA6LZjR_SiInLqTR
X-Proofpoint-GUID: E_D4lqwunPmPcdlGQA6LZjR_SiInLqTR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_083805_376558_54C54140 
X-CRM114-Status: GOOD (  14.58  )
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

On Fri, Jan 30, 2026 at 11:10:12AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> These three patches prepare for the PCS changes, which, subject to
> Qualcomm testing, should be coming in the next cycle.
> 
>  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  2 --
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 31 +++++++++++++++++++---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   | 24 ++---------------
>  4 files changed, 44 insertions(+), 31 deletions(-)
> 

No issues found on the QCS9100 Ride R3 board, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

