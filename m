Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583011075290
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8mxSfzXNyJfRBoaEQdvz7W4Ia4Ks0F5EAbj13/rqrk=; b=NqcrcKdC/Qv7J0A5vG2W47k8Nr
	XeCBowu7oCer6DVXE//6zxnAYiv5dQetSMoHP4Y6Dko6Jcs7Qtqhfvn3hftALoMc+SZHOZWsrEq/Y
	8eYlaKHGiyCPZeVTQMWoRASkPD6QzldNFVilC2kk1SskK1+1ngtBa+sTBXkcwkZk037iD9sElnSuq
	5NW+VvocUEwFiqMOqYlmr/ulUVWeQ2h48nWWTTXiCx5vcHXPMiK9zz1r0lObqFdjuyO3tieG7hCX8
	YKakHxBTwmVr1M4lv80ItwuZ5QmsqZ/pvD6v6VRhICUNfL1JdPYAAtqPlM1YsTumfmCbtUdCexuaN
	kjVzP8bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3AJx-0000000ANfH-1h3p;
	Thu, 19 Mar 2026 10:09:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3AJu-0000000ANev-3VlM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 10:09:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73wVP3927148
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 10:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8mxSfzXNyJfRBoaEQdvz7W4Ia4Ks0F5EAbj13/rqrk=; b=hcTKvR+0CZSQmyRH
	E5MJdOoMORZkt8RutJZE9N3EduJrPpl9OgX1etw5ZQk/WQijVcRYv5QPM++nNaja
	lGnrh32GYZRFt8Fh5h9T3mZfabO0DB4ahegsnRE9ptkh0nJGOPQRTHDckCU1dBsq
	nwk5RuuErkoixgJ9h/WikNvamxST4pIhZcpRxtNfUyIRcdketVqM2K6e4qAKsr8x
	tnozskWT9bsS8fNuHhppJgo/djWubalN55/voA73pqeehqNqVBHHnhXG1p9qMASl
	4a9BPmFeZVEd7CW5myQjRmXB1PECK5h7LCPYj2wgj2jDMMGc/2FjzYdX6r0VSpEv
	p8cIUg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1byhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 10:09:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2a1f123fso3301091cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 03:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773914977; x=1774519777; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N8mxSfzXNyJfRBoaEQdvz7W4Ia4Ks0F5EAbj13/rqrk=;
        b=BMgg0AwxUWnNcdZTvyuKA8KzsC8lnBYSN2qcW1i8VUd5eZ1tld/6GTJYm3LNJW5F4a
         BwvCNTNvTgS8eJbVAiFS6xZJRmoOTbQCeo5XlIjBMdhBCfcy78L/Sk1wDFIOpeSj1pUL
         aQqDQM07+115wF7sWGw55QTBUZhSHtQkKbwqw6JWofEhbDXjoR7sCOgBHu/vdAEad3Gv
         Jk5vuZxaj3uZFIL2q7NaYZWCqpLteYyULyyyA1YJVgfB/Ab6SPe6GMFi2jvm++GGtp/w
         TBtthCP/ICs7vCsywrW64Vq/8MPlSmaWKP+x2RIEiBsotVxfMkWpLG4hBemdDUw3BHi0
         TPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773914977; x=1774519777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8mxSfzXNyJfRBoaEQdvz7W4Ia4Ks0F5EAbj13/rqrk=;
        b=AdajU96Oi8P276lML+LNb/fzAs3TWqUTrfZi5HER1R0EDVvhBY/ioe0qgcy/kje1NK
         +7pPq8/JZZyK6Duj/hEFZrXBTRYMv0OdaxdZQSaaRQGGzTcd1dZ8oqOU9292LKsVl/06
         Smz7U6Is0eP769oyMcmXY1QICupOWy0GzfZffJ9FJxeD7yChV6q39+JxbDc+tQKeQTQf
         9O6Yw6/feagd3sjMG44xxoxJFtqdHZXKisMXO5UUrd3M1IRlLEL5GPKpMwMbmA8e3fJc
         AGBbzihXs9vlUYHELNDkozApmwYb/IhY5wTQWum/MtIV7dH+M69PD9SP2OHHYv/VRe6R
         f1oA==
X-Forwarded-Encrypted: i=1; AJvYcCXUmVKhzgNI94ibEQ4SWNvspYhvuAltMMaVZQV7kDCGfOLwAUzpcC+8DNvDbtly+OxXOR4tCWJyRnTcwjCcYM5L@lists.infradead.org
X-Gm-Message-State: AOJu0YwHdXHAJBeKyfaA8UVE39Lte4MuoXnQY0hvkgWue6u9Xc3riQLv
	2xWUc4qj6rrXv08FrqpmDBzK9kVQ0PtIXTIydjkV0L1pEBqabdHqYMyHbbL2hLykh1F1L/7eAj6
	ngdUZ7wrh4RkdffqZpwErszQm3SXtlgSUlUhFwMxVDQ8dl1uCpXt5XD6IIhidN7KzJkORmyvi/X
	5UJw==
X-Gm-Gg: ATEYQzyJOfeKxRRPqg3OLvfS0pXtc6PISK12jzoWn5srCMC+TKBvynoNgZwBozQvoBd
	2U22/ASKmqZlaHQSj5BvpExdtL5XB2ZjvgK86ojsIvqRCjNd59SfVO1OcJtDZCg973aPczWFizC
	b4YDbgOfw1XTXKRCQYhFm+Z+5Q0QNYvlG3YJYtsicCcXe95sg1I+mnZo1/cVt2Fl54JO8i4jPV/
	5gx2wdCh4LT60u6J4i1+p3vMa3a3TZKZLOBaxnPk3ZjkEg36mYc5Zg/xypssIabG7aO/vJ/5wHS
	J1b+O0OhXzWM4lSIdAGrLefe27M9eXRrjqHDU3+qvDSE5oY6U5VxiZq983O0Luzl7b9NtzScczN
	5VtpkkhMp+lhdnc9RoYLXHHS22ugDKKRiUOLpZy3+WCKvFyXQoSLdi2tHE1cnY1/CWoVmF9oQtj
	bnPN4=
X-Received: by 2002:ac8:59c1:0:b0:509:38b0:c44b with SMTP id d75a77b69052e-50b14866da5mr65080911cf.5.1773914976674;
        Thu, 19 Mar 2026 03:09:36 -0700 (PDT)
X-Received: by 2002:ac8:59c1:0:b0:509:38b0:c44b with SMTP id d75a77b69052e-50b14866da5mr65080601cf.5.1773914976161;
        Thu, 19 Mar 2026 03:09:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6688b67aacesm190582a12.11.2026.03.19.03.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:09:35 -0700 (PDT)
Message-ID: <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 11:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/8] net: stmmac: improve PCS support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com> <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk> <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
 <abtE7sDT75I7uPnk@shell.armlinux.org.uk>
 <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NW-P1hfrWtSPv5j2rrUYU4yNVXLSY6aW
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69bbcb61 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Gtcge7hCmZdjPOC0CCEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: NW-P1hfrWtSPv5j2rrUYU4yNVXLSY6aW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4MCBTYWx0ZWRfXz2/LAUspk0yB
 C9KA3Yv9+Ml0aK9Wmg0gNj4k7eDoDpBpNaZOqPNdJdENA28lroIwegpikDB/s3HW59Ix666fBd1
 SVUAyRlp6SKK+F0xFqB/GQzHdiCBw45ZEj0smCRs249Zo4RgxA+PvfrZGteJprljjl+IE9cWHZv
 T0+oFpCOuI4NVloTBguPrdSe213jUG++uO4WEqgWvqzZT864S0Xo1FW/0gViBuZj2Vl3lWMEIKO
 2lPyCA8X7dDW0N3X/4/Ay8dzS23tiRyYH/dwRv+2JnUC+qW3DJj+H8jVea8rEWFwexyg+aPltst
 Lvl6b/sJ8IdZ2n+imDXXM7iwM5KhLyRryxonYJ9MkkHfQRKI5l8y99tmboDpk/Evlcgr95H5rpl
 PDCIJ7lGZztnsdy5bj8tJLq0hi6qfJMl82EAH6t5SD5MSczPE76/ecLzf6DBADTyznVFHkYwDwh
 5ZbdhwVK2O6pmnjXl8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_030939_045865_4CFDADAF 
X-CRM114-Status: GOOD (  22.57  )
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

On 3/19/26 10:24 AM, Russell King (Oracle) wrote:
> On Thu, Mar 19, 2026 at 12:35:58AM +0000, Russell King (Oracle) wrote:
>> On Thu, Mar 19, 2026 at 03:42:05AM +0530, Mohd Ayaan Anwar wrote:
>>> [    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
>>
>> Please look into this first - with the MDIO bus operating at
>> who-knows-what frequency, this could make reading from the PHY
>> unreliable.
> 
> My guess is clk_get_rate(priv->plat->stmmac_clk) is returning zero,
> which means we don't know the rate of the CSR clock.
> 
> From what I can see in drivers/clk/qcom/gcc-qcs404.c and
> drivers/clk/qcom/gcc-sdx55.c, this looks like this case - the
> struct clk_branch makes no mention of any clock rate, nor does it
> have any parent. From what I can see, neither of these drivers
> specify any rates for any of their clocks, which likely means that
> clk_get_rate() will be zero for all of them.
> 
> Sadly, when I designed the clk API, I didn't think that people would
> be stupid enough not to implement the API properly, more fool me.
> 
> Under the old code, we would've used STMMAC_CSR_20_35M, which means
> we're assuming that the CSR clock is between 20 and 35MHz, even
> though the value is zero. Is that the case? If it's higher than
> 35MHz, then you've been operating the MDIO bus out of IEEE 802.3
> specification, which can make PHY access unrealible.
> 
> In any case, please fix your clock drivers.

I'm not 100% sure the currently-passed AXI clock is what we want
there and the docs aren't super helpful.. is there a synopsys-name
for it? What rates would you expect it to run at?

Konrad

