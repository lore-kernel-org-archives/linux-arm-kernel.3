Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38FCC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zMh1KmHao1LhCLxddpBcSUgeQd+7Z2xRwAtyaliLo0=; b=FH94pcIpUm4iAqwr9IdUeZuqgB
	FvabydWp2p0GWeZyHanliJJaTwB5+iJLoC2F5yLM+Xwzm0ePSz/mKZ52Uw9XF8Fr3qkNcZu0MHP6d
	JbbQM9IsIAeWsvdAzQG4bFUYR36WVAsPGlhHLOvfueGdwc6cOFCFoaLv3NDHNi7Au5Q8K2NIA099d
	Zpdxd7TOfKRNFECO0IdRdnGtLV8RDqyt79XQ5/U9mrqhSGXpGOt7f50eprh0K8n5EAZcGAsfASxJ5
	u44BnbbRTK7aYER0OJv3f2v2Unq6etnMFvV8F0sldifxaJD7A69kijAkgW+mONhDh7SGi0H8JZT67
	z66KWLFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBnd-0000000FtvD-3AKY;
	Fri, 24 Jul 2026 09:02:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBnb-0000000FtuX-0Vpe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:02:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lIak1976816
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zMh1KmHao1LhCLxddpBcSUgeQd+7Z2xRwAtyaliLo0=; b=a7jaVvqrETP7JElo
	NqTryjz8Pj/g+f7EJ+foE0wTJQccpblUSr4FD2Rfp/7SeR4iyEcY27EduZ75LE+c
	6YMl7ZqlfcKGfI3dRD85KNNf8mdny8uUG4csvs6Jk5zhscv4tLwC6RIPnKOdLTDl
	2EZ/Go4zOZH7qUWrhPp1Vnoe8oBRG5MyCrSdMl7l5VK5M+q9Uao6GbZ376cXHPop
	N1q6ZfozVvsoC1qBlbWkMmRmIeSzy48kPNSC8/RNMO7jIKb8VksI2qHtU+JUa1EC
	ZgNVlhwndCA8AKQo3vlhhRM1JDjxEH9euO8bB9reUbaiz4o/O5nh6IoBA5bwpnyu
	UkAANg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fknbmkpat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:02:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so4601135ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784883749; x=1785488549; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zMh1KmHao1LhCLxddpBcSUgeQd+7Z2xRwAtyaliLo0=;
        b=I74MdM0O4l/PGPR3b62uTIXQP97xSwqRC0FAzJYvxQRI9MhQtMGUVTOqlzXG1ZiZzz
         kKS+GVVBM52hrzBboEWg7zEMQhoZ4PM8cBAu6QmoLLvOVLq/TqBewEOM7YrEAbv1JeXk
         5TjAF4q0jm52XY/UDaDm+ZoNvqnk0Z99QiB6w5A7/qfVs3FIDto2RX3basVVVCmChW8y
         3tfOtPWkG0Ccfr0RhCszzepAonn5SXRKoCdRO9bt0c8Oq1irH8oI7Niac0u10vo91HFz
         OgUPGWDKVmzmagS6cnfq0IOAgYL5dZmZKtwEDad0mt5bDlbbZ1INgAtMlPuv0+jtPNw5
         aQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883749; x=1785488549;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zMh1KmHao1LhCLxddpBcSUgeQd+7Z2xRwAtyaliLo0=;
        b=QhJl8RmgvX4eR3rHZR7dBocTb8SJr6A49X+WJuLpv0fuDwVdcTrqzW0x1N77xDJ0PL
         vCeSXSzHrP4GdSa1x/kHHSsW1RbMUoRCuP7+vbEBg/+mMDMmMSVa2bogEoXmrCoQety6
         4gh+NU0jWYZujfZl6bj1sZl7BJjKTSpszL9vd3LGOSsdYbR4ltu1a6DZ+b1Q/fAB7Dee
         ExDKZAGmADJ7Qot9X88Abs7jX7We3ypuPztNGudShpwCPA2I0e5sZn0DnkgX77UP8Ut1
         cUaAsH31a8eu9OPT/BtlAPUvwry5OAlL1FQaTLigrFOIPT5axut9XL8EfWSSUlR39ghd
         9lAw==
X-Forwarded-Encrypted: i=1; AHgh+RqnGBkfdn6uuUPKyuNYf26AR6XsNh+lkVNbrUZIGDGZZhniVwwlUF+2S9uO0lRBncESB/HV3hGECIiu0my2YjXu@lists.infradead.org
X-Gm-Message-State: AOJu0YyqQDnzaCm4WSQGAYP8NMCgzcf0YkCI4G4TSIdF7WtEjAdjiWfk
	s0JMweNiaHTrciAIRSQY1ANZzBKy9a5YBU3xuEbVpTO/Z1HTTJjlEvPB1geSIGt5SSM15VT1mrx
	ULmVIcw0cIMhSX6UONIzycRVnZgwQqjCrR3pDneYSugtGFo2aSwrQ+Q+6XifEFEMFtJzHXA6hZF
	AfjA==
X-Gm-Gg: AR+sD10gTlIph062uOFQ06rmT1EWwits1xcTLINEHIjMozhRWhMC+R98ICcWe1rTr4T
	oqCT05C2jR+j5dv8C1kI/PathLwIOiuBxLNikLQBGoJ8Dy7bsCVM8pmENvIkH2JjdNZEBlJiVjT
	wETsr0EzrPvBvqaxrtbVf7+gGbR1jiBwBDN5TDxPVGJKmfGaQmwiPQQLaMAJ2Yy00KhT+E+UAzR
	SvpRtLJJBEOrerFc6Iy/gGt2md+HcHP8aazhkxyZBSvOIi/b4XsMP6yn8HfkCIg9NfBW22l5hoX
	H3Mf8KY+2/OY4xo/ccz73L0UIed1gQiKNfRGds/BANjWygP5K32+u3kBpKi7yBCDZu4j65SLJkn
	nZlOQnG8LQdbfgfMIH7b+6QzFHHMA8i4vqWbt0u+uIB/r8gZISs4B0HfIE3rgfuMujynQrmYPVh
	iRTEPDT2moKn5MfhxBeg5rRo5f4Q==
X-Received: by 2002:a17:902:d2c7:b0:2cf:ba0c:aa5a with SMTP id d9443c01a7336-2cfba0cb91amr39535195ad.47.1784883748702;
        Fri, 24 Jul 2026 02:02:28 -0700 (PDT)
X-Received: by 2002:a17:902:d2c7:b0:2cf:ba0c:aa5a with SMTP id d9443c01a7336-2cfba0cb91amr39534615ad.47.1784883748164;
        Fri, 24 Jul 2026 02:02:28 -0700 (PDT)
Received: from [10.190.200.168] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efddfe1sm48392965ad.32.2026.07.24.02.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 02:02:27 -0700 (PDT)
Message-ID: <cce14564-9f74-48d1-a18d-8db6a265b7ac@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:32:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/10] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>,
        Jia Yang <jia.yang@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
 <20260724-space-magpie-of-promise-b71ead@sudeepholla>
Content-Language: en-US
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
In-Reply-To: <20260724-space-magpie-of-promise-b71ead@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e742j6p/ c=1 sm=1 tr=0 ts=6a632a25 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=mBLlwB273A3eCssxvk8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 6q9sDbfC7FYp3cLPt5Dwj-hDz9M4i1Sn
X-Proofpoint-GUID: 6q9sDbfC7FYp3cLPt5Dwj-hDz9M4i1Sn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MiBTYWx0ZWRfXzopvbGLmlOL5
 WhvjXZxnKGbnKL0NMeEyI5X8Cjec2KJFvw2JcMQGKlJ0uQteG7gdlYsvNWpE15+DRDqOC578RVo
 5As40d84KIVOh0KP54+YDf93cn0PTxA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MiBTYWx0ZWRfX0EYgA/b6FEwA
 epahXlF8mD4uzl5isBKopl+ZCAxYadtTCHb+5bGZd+n7gpLPs6Un9I8TMwOLX22wq9UEBt87n6s
 Mo+oVIqt3DveLQpGvuruSpLdfSqUQELqU3hRJZJ2F4JwFdkYeGjqYWFsgyXDIfR/fIvf9X2cCOo
 UmWFMAxYS7mLmWEPnF5XziLHFm5Daj7KbVDhqRCCTx7bTva/ClyxsXz0L9ATZxVFwYqWCkDeHWi
 NRxpluKhkJlGI4BNQ9Y894Zr8d3rTSDMR+SdAxDRU76eEuO4Oxg+Pk81wJ/Ix+6yCpbkXV3Koon
 4qk+kGp3653FzF42yHa923xYOyoNhIO01qrx4ghHdYJ9K1J1d0CnWiyLQeoJRTIx696nQO06Cir
 j889UfHKrbXj7Vs/cCwe8gLcc8djWDmZEx5CAnBsDga9/u1j9XiQfGkHDbMTZCpsn9CMB9pWKbD
 bxPLL9U+5/9Y8e/Dh3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_020231_279946_7EB4CEC5 
X-CRM114-Status: GOOD (  11.97  )
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



On 24-Jul-26 2:10 PM, Sudeep Holla wrote:
> On Fri, Jul 24, 2026 at 12:48:05PM +0530, Pragnesh Papaniya wrote:
> 
> [...]
> 
>>
>> Changes in v8:
> 
> Yet the patches are labelled as if they are RFC and/or v1, so it gets really
> hard to track.

It was a miss. Won't happen again.

Thanks,
pragnesh

> 


