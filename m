Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EAACC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 18:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmKAgT+BMROb7bsj9FpwRJzAdtcudV6UZcveycRYTO8=; b=Pn0R7teD9wdJ0hiUipGgMOS9Ng
	/88vW6U6u5BNO4jAx4Qh7LeTsC3EQ/4+xC2jeqycoWzVx01sp+YG/a1IrnfZKTzzZ31bGH2+QNYso
	bkAwIDiJgX5q0GToYD3u71m+Ixic5dZWxjwuFdb0pPneyYSyGfYlXErS0iVgRzwqpj1bS8HkUZWMi
	QhqDE4qIxYAz4V37iUlUgrysBC52ZY/5X+dKP94M+s9pDsQH1PKK+I+yafnrg8ZoGeScVEtJGcE2x
	9CMEdW6hn+ZFK7Lfxs3yEVmG6U6VYVVxbeDgtbkRG4Uip0fvfn1ZtWsrTQYcAvtIIT4hjJxK2QGzr
	tEqUrLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH43a-0000000GArJ-2pwJ;
	Wed, 14 Oct 2026 18:50:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH43Y-0000000GAqr-1Jzf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 18:50:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EGZhYi3468837
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 18:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QmKAgT+BMROb7bsj9FpwRJzAdtcudV6UZcveycRYTO8=; b=hLw7FgaYpyNo6zxN
	l8UvMhOCymTJmyoS3bWMjr5HzJVHGUDmM15PoeZw62rTAv7lAWVn+4w/Hn5g1+4X
	/m3XN9322dQYzH9LtDo5PYG58tsWg3pKe4CtmZEZalzj1aiYPrgalBB9KeuhcMVa
	BjmDS62vTj3Cuh3fTXBp0SJqfQjY8d1DAXX/AKNu1k1YrIaTOed3GbTA2OUWXI0b
	5Q0OHU11f0kfDr+XCUAoOHBPuYcu2vtzh4LNNBYJz1WtBvllA9e5EVxr1BQsDWjP
	ON1rFDnOcHjgSE319n24TVY1oL3h6wsAC8z3P7FyoemA7Qxus3vGzHqRDohxXyc1
	mVfA8g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd78hp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 18:50:26 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-17dc865c94cso707715c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 11:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792003826; x=1792608626; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmKAgT+BMROb7bsj9FpwRJzAdtcudV6UZcveycRYTO8=;
        b=Vz++mB4gwbSXu0xZcILgLrC8EzDD7wuNqA4F/ZDER/Z53dH/NQuKfG4p9BVlsXdlJj
         MifEY1lABUFE6xWQoW/Zrx/XEOPTY1hC0wawDPXUFG0xMZedeZFUPiVrIW+GxtGd1Ekr
         GjQ5YQl8d5QWTg9ADaOJUGlaF627iTVThduN2vz1NISNs9y2o20658etNHnsArrLeHT+
         mM+fsc8FR4PmWLYsfBIJ9xlVmhnPsYrIDBbN0Bdy3TRy31qfa/BSgSvFwL6Uv5HpBOe0
         GGW7kp37giH63QG8hiddylpCdeyLl7DFu0TCxsxmryyzy/NSxHUhv7Dx1VAoQVpNkWRZ
         UKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792003826; x=1792608626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmKAgT+BMROb7bsj9FpwRJzAdtcudV6UZcveycRYTO8=;
        b=JCFlfiqlKg7CbeTBbfLeqQr4eS7CHRIyyXysuqxJkK0FNdgFjsbq+6ywBI6IJCHPMk
         OYWQmgLCIjg1AqD56g+nJRM3P/afbrn2nP5pIWIQPGGZzBOSbwJMrj8Ib7MC/96HJkrk
         m3PLCUjZ850So2uHcoQJwTKJqAy8OWtidIxw542KNSdStXGbn1ZlelG7x9TASM7QarQm
         QSlg15FWOPlgwdtJvPHPNkOGtPjYdddUZbX/DwoedaqlS0p+vdwiz63S5v55pPveaGtH
         hoqaieF+bL1H8kfPZw2D3+gozmHPdsxob9TTLcE7tzzpQEpoVZPxZcQircz7zCzI6Tnr
         666Q==
X-Forwarded-Encrypted: i=1; AKwUvBwlfZsh/+Bmbjkm0FWFrTDrJm7i+5GC3NFQSdVjdckfk/e1yRa381X5JIwHdHo20oxGobKcIgcBtByvb9m4Xr+q@lists.infradead.org
X-Gm-Message-State: AFq9FYKe06QhOTamNs9UCOWOPUjH8ZL2ne76Zk9cLcCLnsWOuIg8Uv2t
	P+FDekfX4wS+xPBD5+WZ3agF5dP//zmr+qiPGsljOyeqrjwyxAQNzF2shaoPjtHJM5HTl+YaI+h
	yzYPeJSlV4b98AjcTSATHktcKjPr+76c31D0+cySZBbbiQf9FUQluwxa36qIFTAp4uhit+P/A0/
	SY7Q==
X-Gm-Gg: AYBFou29rJiAkgLDtSgar4B+gAePeURDmoj3hNmGVr9O5UDtviXXIJXhZiBCouyad6x
	a4dGw+FB3u0nqeLdm8pJCYlsfttNjjvgXTyNmxs2LvSdnLTnB19HaRnK7Pc3Lo+B7ZhBxrZ7pXk
	yC5h0Jih237ufs8KxxrLvzxxhqeJVEBV2AArc4A9fzB6swkfAXukpgLTeWQFrEj+BTV3nnYgz0/
	29xLhgWuKC3tTRwnRciRCgv12pGyujfrVhAaa385L/45ypHlZCG7bcYMsskzgl0PJToXsgRoNvr
	Vy+sT9zAK/5Mv40JWO+RDFD9/k34aUBh6WQdxqxFtABUHpR95/ZJJNXJ3uobJRDksl/QDqPC1mm
	0B6bYHRiGZ2pTLzJV2FOBvwsCRTHoUeRj
X-Received: by 2002:a05:7022:1582:b0:143:298e:913d with SMTP id a92af1059eb24-16a63b2edc7mr32561296c88.47.1792003825562;
        Wed, 14 Oct 2026 11:50:25 -0700 (PDT)
X-Received: by 2002:a05:7022:1582:b0:143:298e:913d with SMTP id a92af1059eb24-16a63b2edc7mr32561225c88.47.1792003824748;
        Wed, 14 Oct 2026 11:50:24 -0700 (PDT)
Received: from [192.168.1.2] ([106.222.235.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm62519780c88.16.2026.10.14.11.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 11:50:23 -0700 (PDT)
Message-ID: <16d94994-ff80-405c-ad98-ccefe4f951d6@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 00:20:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] i2c: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-9-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-9-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6acfcef2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=N5Y/PXOiYxOVLBGg3HvMCg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UheTk5Niw0niUJ_rJrEA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: MCXOipVQR61AKonBbIM35-rKBSWmaU4E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3NSBTYWx0ZWRfX8Iv+IaPpc51w
 3ZGDEQbqBTWAPfl+FUUVnleRjlt/1wNAmnG8798LrU7wnfJjAhx2qGXNl7MK7cHw7RXPYCGj/7t
 N1Px5C/67WOPjVnUX6uEYOMmt5Q/Y46sdHL2E19oiHWEoDnbXPr2VzwS2KCdl+OKqpH43MHZT32
 yHaCVjSCQ1nHr5g1xBMMiQu7/IcY8dPVemlZ4+mzKqxU6wnSaWN5ALC+07+vBmWlEZsIJRYrYiZ
 jcrLELGXte5WGl5gC2lV2TbomOQgKgp5Ab0viXul+O3bdXrbd4SFcMHas7Ji30jd25/ChO98r/+
 gO5vkzU8nh4deXUIeQF8vAIH+rKCdzfyoi00KKjTgcbOrkWA0aQdo/SSAFLR6WTI25Tl87JA4Eb
 YsYaDb5OwGy8qpySHR61+q8B1N/C6+8+ecmqq7GEiMBR5WZ0YPRqFpYNnN9QSWPTZD8dhR/qAdT
 uYMMoJtTkHONxMCI0Lw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3NSBTYWx0ZWRfX1/7rBnmQ24cK
 FO2Nlt7fcgXV2TeHhdQSBrIL98nlyNDkMSgB7rhFsATki7SxtcFHm2oTS3eVy0sbaH23AveUqz0
 6yc6/pByxzRlRTY2Eit7VpSdMAVaU90=
X-Proofpoint-ORIG-GUID: MCXOipVQR61AKonBbIM35-rKBSWmaU4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_115028_368112_10402A1E 
X-CRM114-Status: GOOD (  13.91  )
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



On 8/27/2026 11:29 PM, Praveen Talari wrote:
> GENI resource management may be handled either through the Linux clock
> framework or a firmware-managed performance domain. Source clock
> programming currently depends on platform-specific callbacks.
> 
> Use geni_se_set_rate() for source clock programming and perform the
> source clock configuration from qcom_geni_i2c_conf(), allowing the GENI
> core to abstract the underlying resource-management mechanism from the
> I2C driver. This removes the need for platform-specific rate-setting
> callbacks and enables a common code path across all GENI I2C platforms.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

