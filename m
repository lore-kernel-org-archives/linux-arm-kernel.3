Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997EAC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fphhkzCia/0/dPRwk/cb2MyHyGqohOAAxhBw9rbGd8=; b=z7Jb2QykBEXWtdD46rwEU0l46h
	l3OJnQqzbmIlnGTnQj0Rsmpbe8SYt0qxHLqqrBVqKLWXuyrhM6RTFm7nrnf6Sn+/OWGLeapybUpnC
	Vtz273fDCHV7PIAyCmKpZFN1aEsm/IajJ6hzXO1KNrNUckAMYGYKbmatrNlawz7pE319xY9+2w/Mx
	735QmwhTCy6nNjIMY6/nb/PPRoElHsw5BQXmIZFFwJbGEpWveUzkjuj3tQQ9T1uWn88bm9PyM38n7
	waXYFYfr+mUyWl2NeNBQv8AdJ/OyTUShkUvzIMY2ny2FcwzMaB0BL/eN4gpz0md2VQxGBFrygKqP0
	VEy31XVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ezU-0000000FUpQ-1x2X;
	Fri, 18 Sep 2026 20:15:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ezQ-0000000FUoo-1lXE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 20:15:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IKElHt1552004
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 20:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4fphhkzCia/0/dPRwk/cb2MyHyGqohOAAxhBw9rbGd8=; b=fD+GOeD71lokuXXG
	oJyTKl62II+bfiT3x5V68weBwsLkg9k0od+HRHDm4+GZPneZ0rSVR3w2QUOH7/pw
	UNWejuimY6L0ZLLOeESBh50eAYjFNfHe3zXTwhOZP1teCpiEJouwTj8EGHL+Qdrh
	RMVz/5TxpvNsuqI8wUqK/nhIHybVDHbECqwV6i5UopMmYUHa+WXWSsTJKITIBDoy
	J43SqZyKNI4Ha47J3UAMB2X5473TXYAcCHjWOvProVmHTJZ4IbW4pi9G7Hk7AzN/
	c3svFtW3XkzaM/ld+k00yhCe2xKa+ZG3Iddv2wTj+6RaugeS9ztWVNOzGN/e52eD
	O/3zpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2bum8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 20:15:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so195904685a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 13:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789762518; x=1790367318; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fphhkzCia/0/dPRwk/cb2MyHyGqohOAAxhBw9rbGd8=;
        b=iKi0v3vsYohzdW6K2ltf/PJRpZbG5y3bYHp6W1b5RN78kNCKyL1PrY3CXHpFawUAnj
         GDtBzsT4mVoGMf2jQEcf8DBLbakhX5r/wm8+ebGcgqZLr55t4Rthoqdh2p96QJt2u1c7
         nn0L/hEjVLQhzx7AVI4C5asKosBBqjzSUp5EpfbnmirPss/pVtVTMoRJ5Y1+CKiVom83
         MMkQWelt5y+28H1LeHjyGtYAayRqK7maagEYcpH8USKl3FrC3ZV/pIdHqnCsypYxEu7c
         4BOtibbu3AKxllHMPEzIAduK0ahzyQx6eQojIZIjk2We0iO3MANFmhVpX6p8DyAX06Ab
         VaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789762518; x=1790367318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fphhkzCia/0/dPRwk/cb2MyHyGqohOAAxhBw9rbGd8=;
        b=zIG9F1XegpwE36kWi2g7RHbdb1pDtId7iPF4AtZU0VXssUxHoK/u0P+HEALBbmQgh0
         TMJz96IBc2sVrI4NoYoCyf73Yr0S82PcSvuj5gcCCEVjTfk6M/H6X1RYDVwlelpLA55N
         yRYYJX4zZnrjVs63Y9nhx9K75FC/wvn2PnRjxaeOFB0iOCNgsWVAr6Dh3Tm+ZMvTi6ZY
         WzY3bTCpcX+ufWQ1bCUB6XYQx/ODq7dYWb/XN65m+Fz5cWwULfUKC9BZ2F89rlbgdroT
         8tHrLB0mzM5Y/h/vJiyviO7SEGDMIjrGIo1TRo91lNa/7p7KDQnsb9Y6SN3F0OEzJw/N
         PqUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXV8mOYcADiWaWJDqlHjQX17B4IHggcK0Cuzb9TuW++xm9cc65Ptsgkyf3XbD0nRa3aTtMG4SGr/1VrO/Y/rtS@lists.infradead.org
X-Gm-Message-State: AFuF++mh+rG9CaMRO4vRooRUqFqZKG1dLeMEh0zRwRBc6EPmvsc2dmsk
	dzoIO4ZMe9wgxiQSZqrarwi7Ji0OpD1167pdyaZMNIDbRpzxrS0Cod/0ThXXua4aHaSPWNjzEhx
	+LJrBzFE0cudzglSUTr0DkNhsbnAn/1EptZcMehPbtnb0vjrpNf9Yul7ico3Gx2umPgBc2RFOeT
	E9uw==
X-Gm-Gg: AYBFou0/S+rLx1FOmTpheKOxXcZFTtWdWDhvrI81o+NH1z4c0/anJTUNijU93oRvFK7
	+3oltJODTRUWHjx7km9a4JHvGjJ++USmGmzev39Rt76PVJFdxpdCQrj7ZaJyy9vJcDwxB0GuhiN
	JTSde4+bBwBUq1Qs+IA2QF+UburNXq19raTBFFlBbVuaVvzvez5tvyEGV36C1V5WgRCO519SxVL
	sqJF5aYkbKCXRpo9/SBIMdFjBTes1lAF4lj2Y8vpdfxmaQTaF6sWxSx8oDL1uaanf5sqxsRfRU3
	Yj/toKrtNEj/lHqIx1pVRU73lpxeCmT156GZTrlsSQD3Fh7PBN9s7V1gxK2sEjNxBwAOmFpQF8n
	28YqkTrGjWfvv/ASX9wzUtNgajDzMTLqdDUhNEfWgWYsmPOblG56l/ob8gCGA
X-Received: by 2002:a05:620a:8909:b0:93b:c537:fdb8 with SMTP id af79cd13be357-93bdc6d5b54mr581374785a.6.1789762518480;
        Fri, 18 Sep 2026 13:15:18 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:93b:c537:fdb8 with SMTP id af79cd13be357-93bdc6d5b54mr581369285a.6.1789762517999;
        Fri, 18 Sep 2026 13:15:17 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:bb0:6e51:d247:d411? ([2a05:6e02:1041:c10:bb0:6e51:d247:d411])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460978sm1103863f8f.11.2026.09.18.13.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 13:15:17 -0700 (PDT)
Message-ID: <4189b4c4-3544-4602-b1c5-f298e033c17c@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:15:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
 <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
 <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI5MiBTYWx0ZWRfXxCO2AiofiP+u
 efnaXeUTql9YS0LtuPUsR3EzlTeRnCGQlPMKQmBhfRqOt8HM5w0OpcpSHGPZedVl+Buf1rKKd0P
 SOa/we/VEWAhcCwIXgp+qVx4iqO+gKLC69yHQArNT/jmqPfXzrvQbrCmi5yyHDlwDXK+C+22Cw1
 ctpAkFTRp8M8STAzblb0xgfLKxYoFdyjP3OeHO/Mjx254z/1jT/tSFSX0kvui6m0kSSUzfJjbAW
 56861X0e9DUEbw32FDi3w91U2owFYwwcxDF6LVUaKPoahZAK1Ze7PSAe+1jsbOK7UYJKwfamzow
 SX7nMGU54J6+h8JWzghafKH8R0eRSJ6Fh0N6APzpro5Jr9ovN+6bk8rfXlFbBxadMdMOUYBWmNI
 mGIqaBzbNoUoqTe8iDXZMBVpvIFIVG0ySXaNeloVr6SI0SAWMLyxP+XWYSAuLZmIqXT4ED3hD0W
 tESeKOmtdjnEFBHS4yQ==
X-Proofpoint-GUID: gBbiBc1k_a4HbTl076alxyyoYorbsFiC
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad9bd7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pMJ2f0pklUtnlmghVxoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI5MiBTYWx0ZWRfX/Z3yKIWh1N0r
 VbEJITIqroLNWSPCr1j4+VK5Q6mxrF3cxzM/piw0S4iXTLH36+zj7wE95AJwCWsvBmaciNAieFq
 LC/tS1zvl0yGnLpvgYbK3E+IOTueLP8=
X-Proofpoint-ORIG-GUID: gBbiBc1k_a4HbTl076alxyyoYorbsFiC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_06,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180292
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_131520_586803_EC224680 
X-CRM114-Status: GOOD (  10.62  )
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

On 9/18/26 15:38, Sudeep Holla wrote:

[ ... ]

> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testing
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.

The scmi-cpufreq driver loads automatically now.

Tested-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com> # Lenovo 
T14s Hamoa


