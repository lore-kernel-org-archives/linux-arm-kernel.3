Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0E0C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDIikrNXALA9ripEZXovggm49pwZypGzDJlATaT0TMg=; b=XOMyqyX+nb+DgUlY46JWMJsFa1
	5ghhdimVftcTGDkkzpC18wzBwR5YMndm9BCUdYNdmTVL4J8BLdOsNbFl0XO1Nio+6sdkFWvuL3dbs
	ygLc7w/kEEBdwX2KiMxX7dSu9oYngf76LYWIDJqT1forW8tyN80O01TWfIvuFeKMvRfxTPhXg98QH
	BvdRxGUPa0J2qaO2s1DtfHHe02hKTAMKwrzlSXoNhZCDeTEyqxCqb4qlIg+YgWiEeZ6pvu7ydVgnh
	WDLhypPWhF28trNZ/1ttinUf0PqVW7tMj1Bu6lPDJsSyYmFnFq3wsv5I/qsi3J3JFdEBHp6qBS9Zo
	Hz4YTCXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvt9S-00000005kd6-19RS;
	Mon, 17 Aug 2026 08:57:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvt9Q-00000005kcm-0hT0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:57:01 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H44QOq1176001
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 08:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aDIikrNXALA9ripEZXovggm49pwZypGzDJlATaT0TMg=; b=ewkuABWTflNhPX87
	6fMRiZKezTyGNsZObxtxnmEZeoHT5ErVFZRjYO3RLfo3oU9ZJIBcrdBjmV1qatt6
	FvUGFX41945jfTUdqZ6aaVvBTw9VR+iGGjRCOh7GiPv/d8Qv0DeLPqLyBCDecWud
	a3OpFr1MXYkIVXUyl7ma47FJgU2cY4p4CUsrAy3h5uyj7htIB/QSFqcVhqxBBC26
	MFrzMTwhGGQ00cZKHctZ9RqzFB00YJq9WL4PW2VuatxM7ridAJoftDbhwhNJ8CO0
	VnKUhcKsZN1/WNKejR+136rHhaPnRdbib+mhFz0gVyYUXT2UNE2KPqw7T8dRdefd
	KTE03Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3txy91b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 08:56:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so9092671cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 01:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786957018; x=1787561818; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDIikrNXALA9ripEZXovggm49pwZypGzDJlATaT0TMg=;
        b=i9/xQYsThU3PxcJuU+SpLh+teIMYIG9nyyB3Lw+tzJx9JmErAXW6ABEaxg4PXEL2u7
         5jlLxaPfupMMrdlnxR70s7huVVxg4pUM40ZRohU+hnp9P9V0FWhfWLPjsmXgNsC/HX4n
         BH+MBChdWxLV81xHozrEGHiRz8g3SuzEDzVWdIs15wsDaSRYIlyVTtp3qQHM5IBAWpLT
         ZQxKzt9gSLuov+KoLf6Ssr76UAhohXwMn6k33pEezR1Tz2pP39P9AFH0y4plUi4HKnMd
         xdsRFZ8mX+4aR03Y0eiDEhD2NalXjBaBlHBNnUA0ULSJl7zqxeinftxQAcYLX+eFULSj
         jNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957018; x=1787561818;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDIikrNXALA9ripEZXovggm49pwZypGzDJlATaT0TMg=;
        b=ckPvL2qnBhhxEf/5b9q1c/+6qqxep+NOMw/ec8t+p/uAvFK9eTnxaIdK2pizJQYS0i
         GEipiUusC5u+l2SGc65F7Xa/N3WwqAQXFTKttrvi14AfgdaC5A21JDmEohv5cze5HoWE
         vYLZ1paMGKPYmlh2/5SDRyKH5Z8UogGYaL0MWzR62xuo5G+59mx+68v8m8QYlPmAd/AO
         yw/rn3TKlrMmsI79ZEq5tVBNItP4gZ5d2Vgfyd2yV2JZla2ELEZ99IlptQ57G3ZdtcNS
         sz+TBWV6No3SsWMk4x2Mzc0G2OBeT3rE5Bb7asD4m6FP2YCoAn/0xv+2wHZ7q7Gux55t
         TtXw==
X-Forwarded-Encrypted: i=1; AHgh+RrPPIADs/nBZckMMRaTL0mJ2/R5YEtgOmrtx8W4QT3WQRPuH9tC2Jv1XLIBEB2Tw02qPbxGqPS4EeQasZy2PNRQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxNmvvhTFEEjcWDxKy+0MD5nTJW8GhuOUtYp5LOjzV4ZVLqGwDI
	SnUa9fjC+Or+IlbHVfO/I9n2OhiDmEdknbn57MfoBTPMoB84Pa5mFrP5xVbBE/NuQLX1QSleyPB
	xz6wdp0Aq6RztJuIzpmespRBDQHfLPP3TcQvfQlDrtZJGhaYxllF551aLdw6BqlPbTtq899zQko
	1XEA==
X-Gm-Gg: AR+sD128ogC/SQQdkBs3YXXkV2YxaAkXL8D69xICxrhWUnuyFyZgQqPJ7ag8h1MyVwd
	v2Pferfy/bfBy4FvB3nSG2Xc2nZOxPb0mXgYsseH67XluLuLGvhBlSxjsuAQYaXxDHhiakZkTbN
	ecx2sRYFoXlBcxAEnt/vft5GR6qf7JZhZ0p+4IEfgXhwgh9nrLt31DDm8auByvWmclEk2qLGh44
	+wHSrh1KjjWtFe0OR8FmrKyBh0bQ3/oYB0e7erWtgegyxVVGqbL5ZM31PImlNrKQYaAso3TLwCQ
	+YXwO7Ba/wBMPCdlFWj7rKsvpPdHoX/9T7uj2uphYYvoOuFm/eLahIpCdUgJ7+X7gU1bHtPMd6x
	RT1XLADFyIsTCCBtyq5cB/6BM
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr159908861cf.1.1786957018207;
        Mon, 17 Aug 2026 01:56:58 -0700 (PDT)
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr159908721cf.1.1786957017840;
        Mon, 17 Aug 2026 01:56:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe7c8dfsm25074266b.8.2026.08.17.01.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:56:57 -0700 (PDT)
Message-ID: <c6f35c66-a489-4404-bfd5-506174b49b53@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:56:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: QCOM interfaces should depend on ARCH_QCOM
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <888efe8e63b6a18fae4acd5a90a1e0e69dcdf2ca.1786012495.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <888efe8e63b6a18fae4acd5a90a1e0e69dcdf2ca.1786012495.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA2NiBTYWx0ZWRfX3XTZvCMZ55yo
 8IrbIgOCtrCwpSTYzQDAcVmJkOwXonGYdC3RqqmAOdxYByok9zgVTrqMSdgEhjHcYFfLmYpraQu
 OJZBwfmltcCEi2IRtMCjEAvG7CC2WDc=
X-Authority-Analysis: v=2.4 cv=auGCzyZV c=1 sm=1 tr=0 ts=6a82ccdb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3ImISe4MDvEodWLrb7UA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA2NiBTYWx0ZWRfXydwQm5ruhM6b
 /ra3Ps/NuT4Y/3E8UqSYpp/cii5BBUxti4grRx/USQ5Jb540QqGY9EHUc6KhOS3qezIqKH9xxLC
 dd6CRpnE73ggPbHX/97K9C3wfyF0iB/rHHt8OrE0tnwwz2Lps96joFYQl8DAjBBTLCDC0v63vbx
 P1HSQb3LuF7sUa/o6pfef1G2/Q/vLu7XoGgpMtbQmjy9D0qo1Rkl1y4YttTtZtL33Ph58tLUsPU
 rYN5+a4OxJUscV9cA7wN5BXFnVBRP83YxY4n6FwQRTtxeywccWlYXbbu9y2UDrHMkfFkAa1ZnA9
 S4ipYxlikXepfVvm4m7Jo0D3VZAQvLW4kZgG6R+iJmd8MjBdOdWkxNVJlBL5nM/EgjkwnFyfZM9
 XgOhQK8fHshXeod4BGPsl8oDVYCB3k4CFjspmIbpqBRcb/hapxCt9ecmlDNFRuAOY+bpS4dc5GS
 1qKHYbUE8l4AwlCSdBQ==
X-Proofpoint-GUID: iRN1GQEgbyJaHh6CpOaUNjLXCojmKMxS
X-Proofpoint-ORIG-GUID: iRN1GQEgbyJaHh6CpOaUNjLXCojmKMxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_015700_216049_DC89BDDD 
X-CRM114-Status: GOOD (  16.36  )
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

On 8/6/26 12:35 PM, Geert Uytterhoeven wrote:
> The various Qualcomm firmware interfaces are only present on Qualcomm
> systems.  Hence add dependencies on ARCH_QCOM, to prevent asking the
> user about them when configuring a kernel without Qualcomm SoC support.
> Make QCOM_PAS invisible instead, as it is already selected by its users
> when needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I wondered whether QCOM_SCM should be made invisible, too, as it seems
> to be selected by its users? But apparently commit 5c1a2975d23c51c0
> ("firmware: qcom_scm: Migrate to generic PAS service") in net-next/main
> and soc/for-next made it visible on purpose?

For some context, that commit was part of a series that introduced a
second back-end to the functions that previously only the QCOM_SCM
driver provided ("qcom proprietary TZ interface" vs "what TF-A is
going to provide"), and the author's intention was to make the
former possible to disable

Konrad

