Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68BDC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 09:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zhZU54kOx/DqOOM3ZV5yI/6ZCgYZzJQql12RB//sA8=; b=uKwrAuaua9Z8kg0mdDxGe7/djw
	sYY3O9eLO0q3wjvEXxTuReiSrTlD2CpL5eEShvkvdOOb1TCjepDp9OiMEybrphHRBHZVJLJOPek/6
	7K/qoxk7w8DqMwtmcMv+seGdiQ9p/lIjbLLeVkWHfMIki/YaWLb/NOm2CrwPvq1AiGJVl2a79cWXc
	Wzmzxg5DO6ZhE+U+pwTze1Qcw0RnW5mByvLQtCQqii9a3kqUV+PVeeOD8/0pMfLbZiB3A6hV+egQF
	4FA05pgNu0vsckGORg43T76qvzFiGezrlRRjCp7nUs9pYQmddxfSgMfEetp1NySQkw/P0Sp8YryGB
	gkTl07bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9UX-0000000282f-0Tz3;
	Wed, 26 Aug 2026 09:00:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9UT-00000002827-1Ox7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 09:00:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RcoF3794484
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 09:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2zhZU54kOx/DqOOM3ZV5yI/6
	ZCgYZzJQql12RB//sA8=; b=BpL7Xe3NYC7q9qFq/rMjTqwLQ74p6pJ5hox5Gq5A
	UKYEhPl3hcXhgT5MqJ7CBvp3Nn+Qh6bsl/gP9xxKcbtVur9InEgZVMEW6cLBJZbS
	HF5AYmU/KiWfwijIzMgqM+QVEWeMWTtfjSHSAbF7DobzdJJcd4AFm5VX94VjesgL
	vQoK7ka2aveLp1JO5kGErbxcLXUk91lQradb9KKoj8AczudDpcF7B4e+32wcp0IT
	C+7kgkv38jPNsJgL86npw7cV3UQhQsp5ctTXtfycK2THM1B+SJ4V6w5byV4PxAVW
	jDTmVPciJy0MT6XrwnZOHJfDk7qv6jJHYvWxTxdc+ynf7w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx8xt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 09:00:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0408254aso22465181cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 02:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787734811; x=1788339611; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2zhZU54kOx/DqOOM3ZV5yI/6ZCgYZzJQql12RB//sA8=;
        b=dQDiyAVFwzTcWPYGxTp8Hjrt894XA6Wd1nN6kRB97VtBGxxcz5EmHY049gCgw7l4hi
         rE1XVyyxkN9s5N4EwffiXZUAku24zf0vsz/p7lm8O8oje3BDGu7JRPZruFO8NJmNOLl5
         qJFMnU9LvqwGaOBeT6Bf3DEkd4dPsRlMvoVUjT8lchYflJHz21qZLt5kgINc9cI9y5Rj
         N7bWf2aLKS+XgGq+Cqcqi4xGqA/WbC0XccJK8KYKzxYop35GU1+mXO9mknqoFxguCPWL
         HAzWvuBYGFfWJmOp2dQRhI2EpVrWcuVTkDFIa5o4uQbroGPZCoHjNFNjyDIenT/C/FKq
         COeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734811; x=1788339611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zhZU54kOx/DqOOM3ZV5yI/6ZCgYZzJQql12RB//sA8=;
        b=p589jzPsqaFZFha58V5HWs3bpnNNg0Xb1CmnXTZkbCrnUCZrH/GHdrYRa3AoWtWUQ8
         qvaxPGtqBflM3Pnp5J0IU04pc39JExN0Nn7yyegse0v01sCNhL4ihDS6hQCJjL/zRFM+
         LIVwBMR58eyOp9ow80WvnyjZYfS+vTOcYu+fflt7AObJTtkM4ydbOhJbfhSsBKEFLgGq
         wLc6KWKV4f/K6ZkYkMMTDh0iDm7inshlVm+B6Pq/vfwe/r+On1pSF3/rG29TNA1JKWcg
         OfU34iYuVxaYq3KVzoXX0NXgTo/xc37UHz/Cdl9lPTakcsouDKnt+i90u/nK2iAdpKXA
         0smQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCdLaf82T2YHjbFolbuHbdTefi9H88qBoRkwrKH135pY0RURBHuX2gHfKpoWlg3DmWl5LkdJr/n+QGZUP2QrHq@lists.infradead.org
X-Gm-Message-State: AFuF++mwLbZmRC98tS0nWPsLqhBZgcc3dr4WdDhmC7h1c1kKfCiB/fl9
	ZEaWMmogjVbQuPRl/ItU0DelrDObIbyRet4mzHVjNgBQ5ARH8P2fPyROF9z492PvOd1ycksMsVy
	qZYImgfsHoOYWK3hRwUvTPUW6bbOO3pVmC9NUHClZn4lAVVxj4y+DT8DkeBPkF2hEOqV6GMhX7D
	1U9g==
X-Gm-Gg: AR+sD11Ws5UBFZ9kMdNJxjdkbaYYbcMVYai7AbUSTya1JL+B0rmcbGvdSM01maZDgdb
	WX2nY2PqqmSC7Zfvsne+rNaxsSAlEeSE+cDE+5P5xj1Kp17SCVLYAzzxa24Hu6ZBa3sovxwK6/f
	QEboiWOImn9yuGSG0WRz6VDBKVwMPeiD5cUgjjwGGGLT+oaDamFbDJJ62Jh5joXSkLdLZMpkc7D
	nujd2BTZYdd3NJAdje/K2OBXsq+JAJWRC5RGC/3uNPil2vzYnRaa9Xg4810XckOZlAb+ZYVPSu7
	hmbhTgTCqKZppByy9HGjIDqih3txqAzuNMOzmzH+fe+Uv55HTL+FgGciGwJmYhmk2N2/qZb9jmb
	73FqVJqxim781
X-Received: by 2002:ac8:594b:0:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52e2ec51d8emr120518831cf.9.1787734810525;
        Wed, 26 Aug 2026 02:00:10 -0700 (PDT)
X-Received: by 2002:ac8:594b:0:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52e2ec51d8emr120517771cf.9.1787734809757;
        Wed, 26 Aug 2026 02:00:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8d1188sm3655807a12.7.2026.08.26.02.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 02:00:08 -0700 (PDT)
Date: Wed, 26 Aug 2026 12:00:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        stable@vger.kernel.org
Subject: Re: [PATCH] cpuidle: psci: Fix support for probe deferral by
 dropping the faux device
Message-ID: <irfhmz2ago3suc3o3klfrztq4nhvrbdykuyqsg6pynnkr3naaw@rgnnsjk7ftd4>
References: <20260826084533.38960-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826084533.38960-1-ulf.hansson@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8eab1b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Vx8LKYWbTLu2W_pKgo8A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: aXzvuRCvgafhzlCHn_pKqH-lQdssC07U
X-Proofpoint-ORIG-GUID: aXzvuRCvgafhzlCHn_pKqH-lQdssC07U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX/JNYI+U4qpvl
 GCrm8uRWUSkXaX+N5U6gaNjZqJb6Gfc3UivahyuZLeITdTWE7xTwqJPVzJqcvEdlPG21AAuuUs2
 GI1C/JP/t4eGQAGvnkoPt+rhvOzznsVaU1BwuQx47g4jQp9ogKeP5PYrrQru4JU4SL3SMi4w673
 DIcS/QCO8Li2KwhkZqdiVPMawWo1FyNjKqaGfULghP6uBskYD0GraB3K6oEoUKMZGls/aFSet3h
 ewBtSpWysDebsw0HLH5e4Btfann60aSzsSYCG9+1ndvs/T+kI0K0eZq0NHRQb49T9mrVsskYvDi
 jwQz26upsT/e51lYUvIhCiGGfuibQVI6ys0b2znWGJfI+gNyjBktg99M45tjra2fynkVxAFmvDP
 I6/+PRjar/XXJbP0i6qnQjGwtuRjq/JEx9ICgCcJz1GHoFCzA7rFMkb/5pQNa8sP4F3Q5MTDffI
 x84Zj0DV1m22Sh9AF3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX2+jzQTiAcBzm
 JnvBhwP43dlouWXxWG1b5jXPYaEHWdM44/BYr9IKaZJ3ykiZhXjTUT7Dnrz1CHTh6jrqly5+2Fk
 ldly1gb6tNEPig3h5Y9eVZ/GK8Z8iec=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_020013_694282_9D0FCEC1 
X-CRM114-Status: GOOD (  14.17  )
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

On 26-08-26 10:45:32, Ulf Hansson wrote:
> From: Ulf Hansson <ulfh@kernel.org>
> 
> At the conversion to the faux driver/device we broke the support for probe
> deferral. In hindsight, the move to the faux device seems questionable, as
> it simply makes the code more complicated and for no good reason.
> 
> To fix the support for the probe deferral let's therefore restore the old
> code and drop the faux device.
> 
> Fixes: af5376a77e87 ("cpuidle: psci: Transition to the faux device interface")
> Fixes: 5836ebeb4a2b ("cpuidle: psci: Avoid initializing faux device if no DT idle states are present")
> Fixes: 39cdf87a97fd ("cpuidle: psci: Fix uninitialized variable in dt_idle_state_present()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ulf Hansson <ulfh@kernel.org>

LGTM.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

