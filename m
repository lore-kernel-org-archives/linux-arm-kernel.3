Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3245EFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcvBYxHAlvNI6sLP0AoxikyRe9LehpKzs6txgD8Qv9A=; b=ZX+PREOPZeIXWFMlE1TPOPAn99
	hcJ02kqyqeFTN5q/ECMeMTwtzdp0UHf2f6PyK7C0s59+X8KM45iBdDOVp1EBr2ITb/BFDGKdGa/V7
	RBFYtWCWjtVnSZeUQ+vqJMKveADxA9XZTd4n2kHagcWqM90ExbIUvl299BT/6SPgpX5e0J1fEXhNb
	qPKkQPVjNhEd5BRLID85JLfvjxVYMv9ZD6XM984XPJS/e0QHahuwRke5sFEeDQinxWWwSplLTmX4S
	nW68LGg5VrDU1solBmbimIRQp8Hyrjvy41lp4EYlVWiJ1TKRDDbxUlUs8mLOGSuNrPKQM503pdJ95
	RgLII2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKInf-0000000GvCN-2lTM;
	Tue, 05 May 2026 16:39:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKInd-0000000GvBi-23E9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:39:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645Do0rP3475631
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 16:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kcvBYxHAlvNI6sLP0AoxikyR
	e9LehpKzs6txgD8Qv9A=; b=M+F8y2Fs4/hg36XqYjUZ2aG/CZNEeOdd7UKhLo9j
	8Y0UqL088LknMkhUQRRyzARuoO+oNdGh9YxrOOAxY/U7s1HsLB3jq8q8b572Tqb5
	2J2XraWuZBz9LdfA9uEUNIDzVwbtTmdX/TNaSRaMM6PHAW6gsR0T2etdCqgyjR9W
	OtKYqNDll3aDE4gWGrusBKXkSTVYtXtVbLt7Z4gD7cN8n6QH/CpYQCimZn7DQWrF
	m3GQg+lAgKMKOaKN63Lthabq8F8NRozdfQsqR4fdsT1/DalMjesfDByXRSWYZ8Ws
	d0ZxdzHiQipQdq+w9AFeL3epabsWRpQeHSAmWpEXG/tBww==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhsgrr9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 16:39:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba718173d1so4991555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777999148; x=1778603948; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcvBYxHAlvNI6sLP0AoxikyRe9LehpKzs6txgD8Qv9A=;
        b=CXDO6xTHxXUZiA423hqVh9VjOwvFjQZSsZjv//psp5jgJdUHWNBKz85XH1+dQeecXg
         Is/I+L1ZTEZg3YQKl/MHytD0WafdyHnzVSnS5vIp3apS5mNOZ9gpQUxiL7Lj+PNhwIk7
         /N+/J/wfu6Aba+SCeE4nCOTjWxCmoPTq9zabVajhewu5z8x+EMNpZ9Xg3BdPCPKUy1cz
         qia6mgO0r3m1BuLebry7AAf6BMUjIym3t/1G8HctPlgvf5QzuJ75WWb1DJsw9sKXIAwj
         GJm54yrzJPQx0BPUtC6yd4POaLtS5VZKF8+RIB8tdOumVuy3raP5QRqcrM4Qkc3OmIeX
         qD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999148; x=1778603948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcvBYxHAlvNI6sLP0AoxikyRe9LehpKzs6txgD8Qv9A=;
        b=WXijhDiZXx8lJF5nR1OMZyioHdWQD30MS7KqYsbmdR3iLhEtbcBvD2vnDOxYIbjVoq
         CHEynR21q9vle+LrRNzsCE4tVSKe1hh5+6PAvWZRrxOspxzdW2pwTwcTfCDH1GOu357d
         SraWz0xW4dsLrDPTppd3E0kxPqvOt7NYlX+4Pg7uIWXT6hRHfum6l9Nqic3tiWq1sYSi
         QKAD7MkWOjff+PW5oGKtGkD6Ac9ZvRjuik1n6K+ED4PNfT14mwF6dKp3poTx75ijJFuz
         QYA/GPji6sT/KrX7ANMpP6X6Lt7/X9eF3j6p72KOqKZob+SNzW3VmDeNaKwM3FrEyS8R
         dCqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EA4SEr6tD9N6QT9VuFe5sBsv97Bh8YJ3vW9u54LyEkjovmcpm5pj5W1cLjE8iDj2vQaK7AAOiI6nnhBHrO9hu@lists.infradead.org
X-Gm-Message-State: AOJu0YxPr9TYhmfWa806myWFJh/k3DBJVYh5Q4sDXsC0UJsI3SjWKazM
	7QAGHgv+hQQIwdX0SD6gzK0S8hoeJ/7CL2Kj8iDNhq9RF0K4i63hX/5GWBXcdffHrRnmg6d5wY5
	JwYdD+c1UM+pWh6minYBjDe37SDCtiwPUDFt3j17yXJxaWJd6DxF35/4sO55TcRX5+1iGkcbUCK
	bF8A==
X-Gm-Gg: AeBDietPU07UryI6gdWHyPXb+OKBUI07p/U6KPGTlAySTen96vzBpcddvQRa57yCqa6
	WBqRpPUJ/ALrajpBmf7s9i8C361yoICAGuh6AhNz2Vd8yjsJjE56g/usYM42xag7ReytFhc6ZrO
	VxIiNDRx+uQIDb7x6Ik1IHQ6+VmwI6u8nRNds7XjLQJdGxNw1eHCh1TiP0Eyty+VEZjhFv4sYMw
	hI0putD+cGJamWpMedeEVAxaGzBgXcqKNk6TLa337IYihqjHIVsRFo0oxIyK/s8dQjVa7Np9+AJ
	8Y5cX0gPswAEFqfU3ONOI/N7LdL4dWOuXHbALc5cb1ly0WpyFogvbz4kKBvv8PkW3GVH0jp6UQh
	zZSxjvVnvxyMZihBrPsxthod+qFp0FNR8Z3E1jHx0PRs4BA==
X-Received: by 2002:a17:902:ebd1:b0:2b9:eb6a:68b5 with SMTP id d9443c01a7336-2b9f28348efmr149463365ad.38.1777999147945;
        Tue, 05 May 2026 09:39:07 -0700 (PDT)
X-Received: by 2002:a17:902:ebd1:b0:2b9:eb6a:68b5 with SMTP id d9443c01a7336-2b9f28348efmr149462845ad.38.1777999147261;
        Tue, 05 May 2026 09:39:07 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae15fb6sm148392135ad.43.2026.05.05.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:39:06 -0700 (PDT)
Date: Tue, 5 May 2026 22:08:51 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
        rmk+kernel@armlinux.org.uk, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org, Daniel Thompson <daniel@riscstar.com>,
        a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
        boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
        chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
        julianbraha@gmail.com, livelycarpet87@gmail.com,
        matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
        prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
        rohan.g.thomas@altera.com, sdf@fomichev.me,
        siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
        wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
Message-ID: <afodG9uuopgfvSmu@oss.qualcomm.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501155421.3329862-11-elder@riscstar.com>
X-Proofpoint-ORIG-GUID: sVnjHtaTHpvUezpWq57SksX09RxvOsR0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MCBTYWx0ZWRfXwih7lXyHeNpK
 KAcvd7HYflHS7U+2sIK20YTl1jbqm0ayMOfVsYjtJq+cYsaq6n1Hmh63H/FAsPoq/DHH7xoh/la
 quHnvXB6WmjfNHww9b8/x1JHlb1iI5pRYxaG1t6VSmbFb4Nm7Wr0Mf0+BX6wP1LOqN+xsXvCZ8g
 Sxphq8xBdr886gAAQKSRsQFAB41qegU2x88r6oDMtc+97nNLDzddpWf5t9qUTRv9KwToKCaUKk6
 eEqUyif/9hpjbnCf9iXVyqmsKKPCSSFqORA9J/Zf8ioFGJSOJ4+MhTBB4sJNr6engdtiUeuw9r6
 w3GgM4pFylue9HBPg2juClBI22XgkLE28aJb4ZBCZGSJ2E1WcYO9nuzGUt8GkYeBD8Oe7+sRdgP
 kPASQgXArJ1NyfH2E/wjzCzEz8M3SegNMzLBR3JtGKt4iqtHZigSDxeTU0LhPkNOSu7Jc3hMMr8
 J3GlhnDFgbaobR0gy+Q==
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=69fa1d2c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=YOnX06L-6IeA1UCcW-kA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: sVnjHtaTHpvUezpWq57SksX09RxvOsR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1011 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_093909_530288_0624CC2D 
X-CRM114-Status: GOOD (  16.31  )
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

Hi Alex,
On Fri, May 01, 2026 at 10:54:18AM -0500, Alex Elder wrote:

> +	/*
> +	 * TX956x has 8 TX queues but only #0 to #3 work for general IP traffic.

Minor typo in the comment: I think you meant TC956X instead of TX956X?

> +
> +	for (i = 0; i < td->plat->rx_queues_to_use; i++) {
> +		res->rx_irq[i] = irq_create_mapping(irq_domain, HWIRQ_RX0 + i);
> +		if (!res->tx_irq[i])

Typo: res->rx_irq instead of res->tx_irq.

PS: I was able to successfully test this series out on a Rb3Gen2 board.

	Ayaan

