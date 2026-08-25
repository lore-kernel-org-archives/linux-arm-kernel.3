Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453BCC61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ywz9kH7gTln627j++0eOYkrzMzb6+AiHqb1QNVbCm78=; b=HhSkK7HqZMLiWtEKqeYTE2VOHO
	0uZmbVABxm2gMIiKfEw5W5Lzi+b4J/p6i609pVSQSmBXSLH1M+mgvvaI9H76O+s8RAhls8SJANZFL
	GF7Db0/Iw5S3f9D9Xe5vHyD5SC9WZp/pPPK5rokjO2WxcZj5LL7CvtDp73ohZiW25S/Lnn0bpY2Gd
	Y76RB1sEerD5GtvrV6Iz565kynFp8c6x9lmdvVTxXpt1p0yD5C6UgK8o9HIFsRWyZpQNn/mRYy13C
	NSpJDaOIY2G8rcB59omAlV15AF85cHZvF/ofo2K39PUNzfJL9ZfyZxqjsflJ7dycYaUBUE9GBE/t7
	n9QwtqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymQw-00000000N7z-2Z71;
	Tue, 25 Aug 2026 08:23:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymQu-00000000N7X-0kEB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 08:23:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88bCU1253584
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 08:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ywz9kH7gTln627j++0eOYkrz
	Mzb6+AiHqb1QNVbCm78=; b=cJObNxZoa+HbrFvBFQ1ru1TxDdBS/19QcmdXzbsS
	JezWSTJ/JX6BEnSx3McaDZcdeRb8zxcJzt9OBCsmpJ5TbONQYMbmEoQXrw64sQKf
	+knun4kxmL+UuXAoIeVu2eeJdoDwUxzlTFYHo5k8TCUSyPXow1jnxrU1VAZ8b0Ck
	3y9kD7g9xKnIqG9hMv9IkhKaTlNAipvMBpAHTYzMTRN81ghQAbFEpV91PvrV8tWc
	b1aWJoSxXSMbwAQEArCCERwR63DVMQeE1thTJO9Qc7WQ38z/vr45Z9pmttd65BWE
	sHIopSczy/pbsFYxJVJUHaCWDWBE28+IsSynzfO7mzXeBQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t1s2vve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 08:22:58 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-977fa96a0a6so525904241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 01:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787646178; x=1788250978; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ywz9kH7gTln627j++0eOYkrzMzb6+AiHqb1QNVbCm78=;
        b=LiTsDQN+lSBSS+PEeX6txpk3HxkVfjnOS9tVVY6ny7lHCS860AzVa9HI1ob2WhH52P
         MT0vMohSOvfXDLvfvaz1pQmgpDiMkOGvGtk35+O515e18kDeuyvKWyDl81IrSfv5h25b
         N4uthdLtL/GnH196XfsbVBHEoiXA/oZl7VSZf3a9uqhEqxsvQJYuRSwaCjEeU3X0Nv/U
         YsTcafQlhTP8mB1bfDVOu/YmkZ+6lWaLlQluqCtT9XLjN9//oDSM1N+E1WA1ToAlNkNp
         lXTAiOu21v0UUvD3vbeMvJgjP+FR6H8xK1Md0C8+XqEH0ACB4mbMleOcCG9Qn+L40IeQ
         PqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646178; x=1788250978;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ywz9kH7gTln627j++0eOYkrzMzb6+AiHqb1QNVbCm78=;
        b=aA56+5xgvqN6p7VDd+iWtBDxr7kbgdT7E12vZWukOU5reFIHfBB5kInqwM5SWHqBWV
         ONCJYBK8h3CH73/3Q7NA01uKZfKrZQDR7LpcWrX0xBa/LFIehBG1aT4/CRKu1H/GoxZl
         brbt5TaI2amd8BL2MOsLCgfaIveAAnwyez9z1HlzGsGCmoDnD3lvT+IyRuXb+mLPXLG5
         HWVzoaWxstDFkX60x1jQttuh2d1ykfyCVifdQSS5XSsxGyRhx1zjH8XCkbXuWOCdeXLf
         PtrOTkCsqUIqNCrs39BCD5aGU3xEUcj6w0vnh2EvqPjog+7ex9d/QmeYVfIDLgYfL5Y3
         AqZA==
X-Forwarded-Encrypted: i=1; AHgh+RpbeOOVcfg0GlwFlRMFN6E7azFGvfK6F9Awm6Bx8jTs6WYff1syjEStazr4XXy/MR/6u8shXGUgU8lO3+lBeeeA@lists.infradead.org
X-Gm-Message-State: AFuF++lPEasNgjmP3AeN4k5ppAAoWXFzrMXizfzUgvdfJe9fC1EQM554
	l8n9K7PhiiUw8Bi+UW8aondJ6pTtYBTOhHkf9szhL2zkUes/9629Ea+iMMfHOzpx+A3U3Sn4YqO
	okFKkUpEO2IJ7FRiv4C+M3YmSQp3zxVkQDZDxKYR0DJTufDZe7EUBwpduUOuownIUNukmgp7f3r
	5f5w==
X-Gm-Gg: AR+sD10JIniUIVfCzthIvo1yuNOnIxJXqHMddSc/KdmvDb/1EhuMFZwONdCDwVyUreM
	AkHlzLPiN/0g2ycvvC7+83vLg8EGhjeqXBIphBJR5owGETy4a6IiCtSYu2157dFW8vRKWqA7v2k
	HNVTN6CCnjgGmOlhdNsnMQZY+m5w/3M8xSdAHDO3N210d+HF7KkW/RasAKdsKVCFeg6d95QE462
	MoiPIvNl6cH4W5cQOVKBXz2YWzVuZr3JIZEvSWwG+JqN7J3hZBiWXCw6s+3/LnWL5GPu94z7WNU
	5aBy4hydFejo2s5IFbYhuACVMetp5O2U3VMIR+iZqlhW1ToWiZ8rRr7OZ44DPM1mNzTI2GFCAgP
	KCkYrZF6xttT5+A==
X-Received: by 2002:a05:6102:6883:b0:777:4e99:6f84 with SMTP id ada2fe7eead31-77fe635f317mr1644164137.1.1787646177502;
        Tue, 25 Aug 2026 01:22:57 -0700 (PDT)
X-Received: by 2002:a05:6102:6883:b0:777:4e99:6f84 with SMTP id ada2fe7eead31-77fe635f317mr1644138137.1.1787646176998;
        Tue, 25 Aug 2026 01:22:56 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2da49bsm14366325a12.29.2026.08.25.01.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:22:55 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:22:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from
 scmi_pd_set_perf_state() on state 0
Message-ID: <2ah2wpjrqixhnws6y33tlkuep3et36q6typfd7ausgaslykmrb@cn6usezfkae6>
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
X-Proofpoint-GUID: o7tVP8skZSI0xEU2YEpEJQ8rkCBfpKjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3MCBTYWx0ZWRfX20uI6Y98t7B/
 tsQW4OQ1/zbvV6nRHD2C3302jGvCwhb2MmOicpr932bVcQ2L9727s4GItfiAjRlJOjmVp8oAu+r
 qD3K8MrYeGMnNz/tAkj8rvohyE6erNbEVcfnK4HWBRL0wmkgFfaQ7La9t55S2EQayQhgPKr64q7
 lGg7OgUgOnpRaYiO9+xyGV+aSlyRefGraV+9VNeUMY0TXN6yrgwvetJoHfemhUFVf+zzRlFsnc7
 m3xxg1zn5LALpVtWizMwb/fW8w58VOmlOUg96+zbgRhYW0ME6StdgHD6EzJf+/2P4k1WYxG9yf+
 NbGpJjBrDzn/nD8BXWtXNKPxY4kOa+ZG+onzDlLRPC5tpM+XUfUIwaDmbTykRSrjDqJT4zdTNJi
 +5UHZaFMY+QBLPZRchA8FLDhdY9CuVA65BHVHcf/5XytsnjSUmKPpXynJI1XO8Lf2hkYaKafKTG
 Bw2d7Vqhohc+hsoT0Iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3MCBTYWx0ZWRfX/SeuDNdgH5aa
 0i5ovTfxf7kFTCAYfoA+8QL17UZAs9PaVcExb2s48NGeeRbGTFIkW/b3V07ARr5VxS8BmrChJiO
 hM7A+blhQftkpm0hgxiV728M0P7YkQI=
X-Authority-Analysis: v=2.4 cv=L7ItheT8 c=1 sm=1 tr=0 ts=6a8d50e2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dS1doENrTls30Ym8nGUA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: o7tVP8skZSI0xEU2YEpEJQ8rkCBfpKjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_012300_336222_786B7E67 
X-CRM114-Status: GOOD (  14.04  )
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

On 26-08-05 01:27:39, Praveen Talari wrote:
> Currently, scmi_pd_set_perf_state() treats a performance state of 0 as
> invalid and returns -EINVAL. As a result, devices attached to SCMI
> performance domains can report failures when relinquishing their
> performance vote.
> 
> The OPP framework use performance state 0 to indicate that no performance
> vote is required. For example, dev_pm_opp_set_rate(dev, 0) is commonly
> used (by firmware or linux)  when a device is runtime suspended.
> 
> A zero performance state does not require any SCMI performance request
> to be sent. Treat it as a no-op and return success instead of reporting
> an error.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

