Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D137C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 19:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsh2UtAwZF8dVDdfcIpXUpF41HpbSyTO2Zf5uTTvtjA=; b=LBxXxTr9NUGCOXg9lynGONkM4y
	rxSM3bz7rNuwUHry8kXARRdyVeMr82bfGkcdyUhgVKctyZTnE54LeZkvQNNew6Ook09Fa/aMsSAbN
	GuN3sATFHdVtkKlrwbh6Be6tGbn7VuSh0zwwVonXwa/dh88H/KEtgXunbxF9Y8sl7TrthmktuoAOh
	Hyaq7B5WNSU98rYlJXN11M1lEIi+33rs2AZyFmBz108FocNm8T5MZTImjgwAp2+B4H3ujgpkDBArs
	kwntV+5HtIICVdpWXx6vThq6yRIY3t4zTJLXkzP3C0VYN+XgWD+d/ZB0hdwEAfcD0Q8ZiWVErxQ/f
	oecao9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGWg-00000005Zjh-3y5Q;
	Fri, 10 Jul 2026 19:04:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGWe-00000005ZjJ-2bjQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 19:04:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH4IwF1234481
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xsh2UtAwZF8dVDdfcIpXUpF41HpbSyTO2Zf5uTTvtjA=; b=VSIgiN/OdJOxAwl0
	rGMUILflqtHg7sE5TIOmgkyaT4iunv3HsULs67fyGANv2W4uLvkwDGVehdfaeFUu
	GB/XVqIeBuvS4rjFfiJTXu8XKepgOaPBjOGGHHgXp1rrYdI8RsLhOJXVrxAhB8MC
	P4fF6yen/EYDO+Ui/aSBWyRaNmsnWr3tMRr9Q2PuNdPQWai9MhcGEY17ZTpe2CbJ
	O0opAwJRxaq5hzV0A+6ePYLIOIX7t1swBpyKC02t2xYjKj4ZpxvLy4lnMgLjArp0
	PJicsMkb9bc9q1iR84jq/uoo6iXoLDlTF3R/VCpqk8H2kvjjQ8LjRd8wORA6uWeG
	MWRhSg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb4rm8e74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:04:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce870a060so21096835ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 12:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783710279; x=1784315079; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xsh2UtAwZF8dVDdfcIpXUpF41HpbSyTO2Zf5uTTvtjA=;
        b=Q40OVRexy+h5Tt2pabMng2mX2Ida6WRcUwV3mVqMdsZT0Awr3kT6Y3rORc2oWYzrQc
         HmN/EC3K+XnyrEV1ZT71s+oSr5CjvlLioKmuQSEsu5cui2GtwJWFh+qF8OBntSCxke1S
         llcHgXs2NLoiK3C9+PbBWh1OrQQ8aFKp31O1yVOTDPuSH+XvEL61zTdeMwlf+tClc57o
         UO9wSCy98qh7AzwWZrF5zEeVzl4P6zl4creTBXhYdXEMWhkYa7+3ah7v8JitYWebCZvP
         WQh0GljXJim13aK06wOpW+Sp4aJ4Nqp89wj0TycpI9p8jmlZV7NQp5MLhZf/Sa3rEzhC
         E7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783710279; x=1784315079;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xsh2UtAwZF8dVDdfcIpXUpF41HpbSyTO2Zf5uTTvtjA=;
        b=Cui8HZfl/CvA3ybrr1T4E0MMscHpenZNq498IHEMiZxHF2Z/oLtay3nWPSievLT2RL
         fkdgmK5zh9/A1vZWeMsWUPwUitRUcHBNXWPg1QZ6nrQ7uIEBkky/0R8lhOXlxAhtvz8V
         g16qv3dUFAYKFgyryw3r2SuLCX2kPAcoQaWAvS9I/7ElxygRpzp7vZ+8eGnLFtnNGGfW
         RBSyVI/ZAsWlakDPWaqKHOvs/8VoGOxD0KnMLNy0CBRJ5XL55Xx2CisUAbmDheQ/J7TG
         g++HXEg6rFSB88AHkDVHXfhS3rLhIXv1WhfO8fXHuthvaQ16HfTBOaNNve+ZscnFMq+D
         nFbg==
X-Forwarded-Encrypted: i=1; AHgh+Rqsh90Mf+yNC2jvj7uhaxis2k5B/CnELcYHgXZS1USoyTQh/uKrUWqiz739IF6WHzC6mTDrcnBfHoQtg3oVcy5x@lists.infradead.org
X-Gm-Message-State: AOJu0YwKKEHS1OkwbnnHb9Blv0FWy48Jpc1aFDCCiXO84/3jt6DaeWia
	V1JT8blNb0ipzYgq53rjleISZf4xc5rjjbItfe4/3BJuZvhkNk74p3mThnkIIISx+8eHSyIAWwR
	qFRstXAlhfV8sqmfV7dWHzwpZ1YFQ04FwRY4+CXPb/fYNugWMqNKYMOjwDFKPjpEKVZcXXze9To
	b6ew==
X-Gm-Gg: AfdE7cnxI7O04Ga/HqE2Wi7wFbDqPFAg8ACsCJyZcc2ichMio20lHkMxK23xscmoi3i
	G0iyoD3HTaaJA3QMlQVtRFM5XRJXzlw1dyx5nDLjNkTc5sVp74auOTHy8SnX1Qxg6hM3x58dATu
	N2G2dAUeSNWlGoaeTkYmca4z6lNNxOds27qBnh6GNtEBZogFJL1oFioVLGTB75PBYXd2HGlytQy
	jWkhPuWWcH+ayKsbEVDsTulsm+WDKfyXvCoofTpT/HW0hhHI+OIjsj0SWHKVb0hRzdvZ7UM0Aic
	RaDYxlqzsR9l8IrO5o5ynoWoBnBsmlLtY7M500789gHBTEaI1wg8ao2Cb+B7a6GY9jJ84bJGnhE
	7tniLexHTCAzHfvQ/UyVyqgmXvYbSzv6321uO
X-Received: by 2002:a17:90b:510b:b0:387:e0bb:57f5 with SMTP id 98e67ed59e1d1-38dc7798fdcmr201821a91.38.1783710279339;
        Fri, 10 Jul 2026 12:04:39 -0700 (PDT)
X-Received: by 2002:a17:90b:510b:b0:387:e0bb:57f5 with SMTP id 98e67ed59e1d1-38dc7798fdcmr201779a91.38.1783710278860;
        Fri, 10 Jul 2026 12:04:38 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm40533217eec.4.2026.07.10.12.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:04:38 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:04:34 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/16] arm_mpam: propagate MSC write errors for
 hardware probe functions
Message-ID: <20260710120434.000011a9@oss.qualcomm.com>
In-Reply-To: <20260710144520.917375-12-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
	<20260710144520.917375-12-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PhohOZIvV3FpliQzx4d-F3juEtyvonCF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE5MSBTYWx0ZWRfX50jQDNUPYZ0j
 7m57v7NqVr8krMG3H3HsV97hoOfsZuLioGkooENa+D/ybYmsqeLLS/BR0myUXQQUF8Kt5olqymR
 BWfiOF9PrHZoiiP/AqplCsKi38XMlBVWxO4gq57QvI9hFEY55meJq2UwcNhX0FFnv+ecKUPlKY7
 tbL7mJDQ2FwZd4v16OXWIXIVdVOSJ6d4NfAGCccQ/+0jXPkb+7KSNUu1WH0KEUz425uB+yfR9xz
 xqV0S7AHs0HIChoSLztO/ug+vJnq5dwhXqTPoZoUtt56L1h1Dq4LmMe3uqYizqg0NH5FUop1A7+
 Em2rdCImeOyjP0nJA0CVaNeY7YU45lYMsE5Wh6E7ZejYCTuAii00bbv6SrGwZN5yqrKcb9lSDb+
 aysBnzG2zPjIz1nfEoo5Rz9IbrlJABLdui2FyZar0xCfapo7wSmQ6sNP04YWlf2auseItpKLxtB
 WB/imwwizV+9CeDpQ0g==
X-Authority-Analysis: v=2.4 cv=JIYLdcKb c=1 sm=1 tr=0 ts=6a514248 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=00dG4hwU-RTZ5c020ZwA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: PhohOZIvV3FpliQzx4d-F3juEtyvonCF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE5MSBTYWx0ZWRfX6M3CKsLwyz2d
 oVPbCMEbUIiZluY8lt1KEyKrA2QD87Fr9zKotnQEyBErweu6l+8oPbx1tFMGz8xbkEOYTpW0hhl
 Cy+piqmVpPHDNuJ9SW4wMbXH3sN2fAg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_120440_673336_5EEAD19D 
X-CRM114-Status: GOOD (  15.52  )
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

On Fri, 10 Jul 2026 16:45:15 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the MSC write accesses in the hardware probe functions to return an
> error, and propagate write errors from the lower level up.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> @@ -1080,9 +1087,11 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  		ris->idr = idr;
>  
>  		mutex_lock(&msc->part_sel_lock);
> -		__mpam_part_sel(ris_idx, 0, msc);
> -		ret = mpam_ris_hw_probe(ris);
> +		ret = __mpam_part_sel(ris_idx, 0, msc);
> +		if (!ret)
> +			ret = mpam_ris_hw_probe(ris);
>  		mutex_unlock(&msc->part_sel_lock);
> +
Similar to before, scoped_guard() and burn a few lines to get
simpler code flow.

Various other comments from earlier patches apply in this one
as well, I'm just assuming you'll make similar changes (if
you adopt them based on earlier comments)

Jonathan

>  		if (ret)
>  			return ret;
>  	}


