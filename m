Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C00CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7/ELP5QzUV9MtdJIhtE22tOy5vpjDEBoIy32gvwohY=; b=SVd9ksCOWyDqEjsDouKQCDGjjq
	ime+gK0QZ6d6Gxdmi3vtUEYM0ekyqucBo5ENfSgwI2ru4P6frKkuPCNaSpBQWGihWgXXRCKpjseqx
	z2hdhfbWYO2FqFZ99bA7IcT+5DSusspEtrmOR7WP+yA6H4/dz4OSsiIPhSoUDAf7+U3q4pCEm8BPc
	e1rYFih1tjIBA76WC/9G98Y/tGWMOXjrLeUWdiQPXAV1GeLvgIHVFSlEme4tOFVC8An93qMLwK/sD
	s0G9PJbozFnAZ2tz13bQM8OBZK88/MmVtAOOm0NKp61F6x910iI5je53RNuXNB2wjiL8AkuRzxXrf
	gkvBSKPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwqE-0000000FI04-15P8;
	Wed, 14 Oct 2026 11:08:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwq9-0000000FHyk-3ZOz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:08:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7te2Y3017736
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 11:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t7/ELP5QzUV9MtdJIhtE22tO
	y5vpjDEBoIy32gvwohY=; b=QTCKT+P1G+AASpDALulMAYptwpSNSKzHeTLmp6xR
	1Jhftn7PeI951vdOmzt36/Tz+3H4HRanAk6vPQcjZhOBFDQBoaGm6aEKiSL/8tLc
	px+4Fy/EX5i5LGgOr3OHKrvwEK9eMLayUtUL1XgqKhcj/B+o5nTtQQuJ3fZA85rN
	jpfYw/DARozQJNqVfUk0ZoMmExoAEwqBwcSDmaDrIlU4BktVXLd6nWRhuOPnD95x
	bfO11ODDZAWBj+x2GJcAmZJzmewUzrtK8O5ZPRRN4elTa+RhoWqdKCxEMfanIajk
	v5tDv5N9Tpbi/Q75gW+85jlNEd0SKuNPy/d9jSUXXstepA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b402c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 11:08:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ae8e7e546so846966185a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791976088; x=1792580888; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7/ELP5QzUV9MtdJIhtE22tOy5vpjDEBoIy32gvwohY=;
        b=LralLJ2dN0KhiPufC7INCn9XBygVQ+9EnoAC9IAQS90M6IXmT7QAq53EXY7u5ck/JF
         yDuvj1a1jmTHWLKxYJg1LkaLYZTOKEN7sFSjrBb4zPiGSytElghWGdMMDkaTVUu8nwjY
         qail1VKaxfm4zqSqfbZrsQZUZXpwhryMBOJ9h7o93HKt2Ryo/JVtam9Pl8X0m5m5BAyH
         IHVs2kGru7/kbZt16Mky3VbK2J2IZgEROW5Z6+yB5l2fjOQuBPcBEd1BDEtPwvP4pADh
         3OYLLU3D7V6h8VtinxxtaKVs0z7yuUnde1W5aplH5Y6w8fp/7epP+QpQnhJKD1f6pTzl
         e40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976088; x=1792580888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7/ELP5QzUV9MtdJIhtE22tOy5vpjDEBoIy32gvwohY=;
        b=i9GBSKw6VBh/8CfqihEn3sR+nMIpI+1tJ0HdyKEUstJiOZpLdL4444i9tDWXML0hlN
         i4Y/dZdPAYQKly82xT4hTWqxnnrRuPl6rLwnac6VTBVz4bo8AErKEnVbfPwRc6Ekw628
         n6hqjZ3xouKOSwqFbXmkRctObaAwJcoFHUZOpd+WPk/N95dm9gC3vs/iN3Zk+OBPJsmg
         aukNUo8JjkL0/ttBnCMtvMIAug11fPn+xvSvjqi07msNrCZ2UblNjAtBkhfpnYZyQn+u
         1XRswLDxUOrJutFZRujH39iEtkpklkWp+D8//392Xww9H2wMSCD7owXPPRVSnFxUDadH
         8Pgg==
X-Forwarded-Encrypted: i=1; AKwUvByDDUK93N3Z/6tC5yN6qX0MYqM5WnC/PezI501beWosbjfcySgzo9S2b+WhfS6YQDvDhot61TQ1y/cOoL32p8Dh@lists.infradead.org
X-Gm-Message-State: AFq9FYI4XK5VAN42P+fcxRw2VnZNRRx9aD0RLng40De/1B4HYyL/UmRz
	EeCjE4M5UpmA0NKl6L/mYJxVx16L4qOsbCTMJHNGIJ7y696yp0FsBVLJt9m2/eiFZ5AhpzkoWiF
	gc586yzS2EGCllZJvPnhguSJ1dzIWij3Scf/himfBx37kNbHYmMSRi47Tkb6xrcQJGBa/2fwQVV
	uKA5IBAi0gpw==
X-Gm-Gg: AYBFou2Bf3G9XbCIbBGxp5ox/zLeEYOoby2FLqKOhPw+Nd8pEo7Vcl23NGWVtKfpySB
	u3Mqc4hYE+6elp1nX4wUhP2xgNp/LXtfrVMq+ZLRI4byp5zJuBuw4Dq8o6F3CP4AAbk4h5YTBr/
	WFZNkRColxSBDOUXZkQRgeKgPXQpcofjzXtujEsJU25JtQwWZUFFDr6TjODsMn614S9wDJoyo9i
	ZenlKDFb08W0/CY8D0TuuxvcSorExPNePKZzhVBmvM1sxswRttbxyanJv26gTixud3cBXmL8V8F
	rQlICuGiU0TpoxpGxnOZlL5bWPdwurRZ/TC+RwV7DIbcEZ8xrk7riyQ9oSAf4QmQwvG73jer0FM
	A899qgrTCRMNhNY2V
X-Received: by 2002:a05:620a:6601:b0:93e:7192:191c with SMTP id af79cd13be357-93ebd1e0044mr2477178085a.17.1791976088017;
        Wed, 14 Oct 2026 04:08:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6601:b0:93e:7192:191c with SMTP id af79cd13be357-93ebd1e0044mr2477173385a.17.1791976087488;
        Wed, 14 Oct 2026 04:08:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf31b83sm454585915e9.12.2026.10.14.04.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:08:06 -0700 (PDT)
Date: Wed, 14 Oct 2026 14:08:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Brian Masney <bmasney+clk@redhat.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
        linux-amarula@amarulasolutions.com, Peng Fan <peng.fan@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v14 4/4] clk: imx: pll14xx: support spread spectrum clock
 generation
Message-ID: <fqdoyldpejrzju4w4kex652ioi4txzbp7i2cf6zyqgu7h7ymx7@yepdo34huhw4>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
 <20260904101243.412006-5-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904101243.412006-5-dario.binacchi@amarulasolutions.com>
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf6299 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=8AirrxEcAAAA:8 a=iP-xVBlJAAAA:8 a=EUspDBNiAAAA:8 a=HkkWczMphfeU9HmRj9wA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ST-jHhOKWsTCqRlWije3:22
 a=lHLH-nfn2y1bM_0xSXwp:22
X-Proofpoint-GUID: _67pzMVJO8hXrgfVnkFegxwsCGwhy3mM
X-Proofpoint-ORIG-GUID: _67pzMVJO8hXrgfVnkFegxwsCGwhy3mM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NCBTYWx0ZWRfXwReKyR/L/kNp
 Ei2lTks06cXPLvsOw3OIoUlcvuKL3DSzYHLWgotI4aKYUodEOPpJJxNNNGCyakgbeCX+nCHvHad
 1vCJHTuBUBmzDvfchrKOM0g8TmGifUWrtByHoxxN/HCaGavvDzvplZ5/T9OinEbbYfnacLn5IIJ
 zgVQcx63m50bUNTQb0QwkMvIRijykyaZ2ZwPOtsNHvysi7boM7c0Yj9twqAD4JLxy7Vrui4cOuh
 ZO3wuaclmUwN/WMIqre59BQuR45SVkbhzEBShGfrvezjb2nuVSVcg20M3KLfitc1pfm4WWQ9RLn
 gQB/wc/guAN62PY0SY27A2LohuFA9fiCeebSIJdewWf37804pO4PqrnUMMp+73bqddqZLED4FuF
 O3JkVA8psMAhZkpWbQMKYC2bblOEvADvcwAsb30ITjZaRoEYQngrccgZW8e7Kh5ts9RM+g+YLku
 VFKEmpj+x1w/iHIHsgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NCBTYWx0ZWRfX4M4qOt9uy8+N
 z0hIrxrMKXCU+ssz3lzIK4cu/C3g2T5w2ResQFrXpivCQSRksi7F+mIZ6Y+EIBqa0fMoZrXAS/8
 VahkYDPQwUW6wR61I4y2fLxIUvnLKIg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_040809_916891_B802CC2B 
X-CRM114-Status: GOOD (  11.71  )
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

On 26-09-04 12:06:33, Dario Binacchi wrote:
> Add support for spread spectrum clock (SSC) generation to the pll14xx
> driver.
> 
> Tested on the video PLL of i.MX8MN and i.MX8MP based boards.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Brian, you can take this through your tree.

Acked-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

