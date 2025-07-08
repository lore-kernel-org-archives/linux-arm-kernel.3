Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B803C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 13:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=Y7bJBml/5MBGf7Mhtfcz74osCT
	KeNq0vj6O1IG06xEFd8DdoEWRT/nQQViF/UYThOG/iddjwzzgDNWTPmNeDf/FRToTz+DrJ16Q3XAB
	AoeS1leM9K31bo7rOHzbhAiFUXtyDDrr37bSTJRfZBEgrm0KACkBV+DP9AGz7Emg/fQxvsicSuG6i
	ORLN9HA8iIDmMgSnIlTQjyszNOf4IWzink6o6pjb+xs2N/MU48bib/RjU3897hFEjxDYeiemxOLlV
	kRm3YjtX5LOrCSQWUQXE7HYV/sf17iQ+Hqh+kMmMMLC5t7ETzKgyJNmqUZwGYFTuFbtzF0kgZWZ8x
	Ww6mfcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8Av-00000005OVU-1V6s;
	Tue, 08 Jul 2025 13:15:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ84D-00000005NIo-3PfS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 13:09:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAalC017033
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Jul 2025 13:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=pupCTEsZWKvwVFaj
	Fq6QywPPikTVuTb2opn7tBRmUSEnJJECoHJ01EtmgUVbLxLOaD075yS3vjJbXjIy
	eDLtOVvY9EXDf1XlS1m4glK1whQVre5XUxKqevxPd1z2Am0ltKXyNEGJV5M8HJ6I
	rDuNQ2aB0zc14xIOvLdnKnsree6PHxThRxB6eVgnlNPXkPZCGPZ8dUBWQl8EkfI9
	zcEglYLLg3fwOL5LnZwz46mYp2T91EJWAs41WEDy9VwMEDxaNFJu8vg2w+/WWyft
	yGYHLU8xAXjoy2eXqbmsHAa3tr2SnaAFG3+pmv5hbErRZVMbrPx90pAPYxlxbENu
	BRMTYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkn99d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 13:09:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0976a24ceso90234285a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 06:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980139; x=1752584939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=;
        b=oLEa2HuSLikQo1tZOvudSqXYNp6fuJN/zgrG2V5eSEALTP5aMyd+8MlQM6gNJcZITh
         /azlthDgjZ4KHdcfNNJQTeHszeRTBnDgNqq/9EI3bbSChqY2k6TLP0ENdhuWKPK6F1DA
         e5p3i3zlF8UgkALjI1UAd2P//govk+EJU51P9Sh/krQk0+Okkr+T05ORprP5n8UrMxvj
         dzDCn5yyTFS00pTdTg3aQmgqmDL2O9aIZhWb6cGY2suRKb75Ss329z4OTXeYF8CFc/yw
         PuiSctRuxgbDvUFc9o4zhTkUAcs2bQsxTZKx+c6CMpTXFgBIksBqKDju85ZmtKvDJ42Q
         g5jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSN7gigY4SmEfmCHcfTNMBavXKad7kApF0HSssCLVrxlc6dGqPR1tE/a2zV0JpAIDjRQiDf7k5eK58KYkTxXpc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7XMANfyRJPomjIdDCOfjSgaT+viY0oNb67eXKOut+YZ9WImEV
	zg7I7HO3HcRfNj6yUl+E5hTtuumXq1Bxr4h3kArv/w52BHeAxDf9FprkiPP3dlF4CTE5SGwmvt6
	dE643nYEc75k9oQwfo/YQbcY8Jp4TzHYyEil8Wl6XgccgrEVopTGG7N2b1nuQ2H3yVD1JMVlq/7
	jbHg==
X-Gm-Gg: ASbGnctPNR7aav80/p35GtLxeVcHH4l6k+PHTibpT3RK6/0DpHYZfp5lZP4UbXhfj3y
	QBJiS//iSLzTQ8SdtZHk6rVnfE6AKapdr6puLRXemvbZozYYPXCcCvgT13E8wyO8hIODNH8XMJo
	Xa0nDvYy4j76GgZZ6nflRM+BAZW7iGy6zuzIBCKwR4oE3DBhZT0c66IQxZd968TvIMRRmYJdqpZ
	C8pLP1B1X3PPgUhSVhkEWd4tqII5NCz/AwANsdveS64epfYFcej0c5Qu5hlZooRYUkqflTzkRvS
	7/4z11qnljhJmwg5DbsvR0sl7qki510qqM4YnIhmQpbLHSEXohLt7vy8wXAvpST4R2oB7LFjbqH
	OrhA=
X-Received: by 2002:a05:620a:2944:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d5ddc50daemr765450585a.11.1751980139193;
        Tue, 08 Jul 2025 06:08:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSTsfzmJAfztbrESgmPdNkncNaz4K8G5/fia2Gnn0NF2orxJ57CWlxeDI3ewmnGQ+XWEqAMA==
X-Received: by 2002:a05:620a:2944:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d5ddc50daemr765448285a.11.1751980138638;
        Tue, 08 Jul 2025 06:08:58 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb726csm906327766b.179.2025.07.08.06.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:08:57 -0700 (PDT)
Message-ID: <3cdef7db-4835-4e67-8125-9406a0532394@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:08:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] clk: qcom: smd-rpm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
 <20250703-clk-cocci-drop-round-rate-v1-5-3a8da898367e@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-5-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOSBTYWx0ZWRfX33AVsNbcDKid
 A38ft/miGF42t/XiA6gcNWXlwP+O34QM7zA9Xjsqh6UcWc8BQH+6wp9/sGCqzcrrFnH8w4AqOmm
 oHiFzNKsanGV5tqz7iiAlfAgnfLmQkbyKebGfaepzb1xfn+3ud+r+Uvdc5E2J2gQ0RpDGi/esnL
 xX33fNWDlEgUBUIbvD7C5TUbShWzBV2AIvz4lGWS0WBImFbFMjyc90maCXTleos/1wbgPTTli90
 h9pXVF8G1SMbcZ7D+L+jqMmMQ7cSpmK7CBpzFmhmu0mu8wfHi0BmWJkDSbexim/BFhN1pKpqIO4
 j8AzruVN1fZi9OXgLJ3TTpURnnMoIPmjt69JZJMS4OPDEQDNUdA1IS6obo0U0Mst2DAL8gQOWPX
 Ml4NFfcXGiAgfANnyxAXT7fkBKn59cJUYgHZ4NINpY0NkZF3UqC5DNpQ74rMKH9O0gPLCZuN
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686d186d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=oBXrOfH6mq4iYN50PBoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: O8v96Y2XE3BJ51ZEgoo1wMMnDttYKk1W
X-Proofpoint-GUID: O8v96Y2XE3BJ51ZEgoo1wMMnDttYKk1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=849 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_060901_848326_CD06AD30 
X-CRM114-Status: GOOD (  12.56  )
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

On 7/4/25 1:22 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

