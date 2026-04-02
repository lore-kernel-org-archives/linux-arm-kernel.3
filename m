Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FDBD6AAF4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 17:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tq7FG4Q/QQKaF2KEXQXUS/wC9EocSmykX6qtekYg6N8=; b=uSvqvNeu6c97Yeu3gLL9Pf/Ld5
	f1W5g0Ar5e5lbB6svfwB6T850zr2dM60BZlYAdBYQu+33vEAT9BiLScwnv/kBC3k8Ka30JC20XndO
	lMCEsSWXZBEBRA/eXcGGYJAtm+2hAqw9hIC63xmzy2smxDClvqdGQtcnagU1ZblTlfWDQHLC8yla9
	ibhUsYwmebNxm4GWD6ZIToXbYT0MteKKVtnOqUTuVHkNDEol/bNGSraoFN25xbV+vCImhHO/FQunp
	SJht2KfB0n8EcXLWXdG+BzA3LmSU7ttnWMcbnkksdUwHtEECIAjJA0Yx9d5/CahoVUEjfEkroM5dV
	TjNtCrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LmR-00000000af0-0eCU;
	Thu, 02 Apr 2026 17:24:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LmO-00000000aee-3Uiy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 17:24:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4g6V1525615
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 17:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tq7FG4Q/QQKaF2KEXQXUS/wC9EocSmykX6qtekYg6N8=; b=mFC0AVfuix9ruhKO
	2rGfv66jE8X9lHZzyBOFBYXnnbdWbHnaX3BjpilwYpaa7SL5mXjYSGO8f/jFogFr
	qP9crl788a84vPk3NAr+vD44RImcctGCHK4BXFT1tCtBYEc+xcbucdoBdvk0Wox2
	4G+68fXHdj9LcIorXfL4RPn3PnJR0qATNcdazH/G+3ggI538DvGX/BfRe7/0rzjE
	yK8jLAgyDk7ng+/sS9YOpNVQjcvckiifMh+LGbSL6j/Myt41yQtBYLMaTVgGa7E1
	drZq/ZAz2L8N39yhj5vbRpW5qWaV2uUvkIxsbKOTl/zxS22G2YGhUN+0EH1Wtb0m
	NA+sXg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcuauxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 17:24:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5aa81907so12205311cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 10:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775150666; x=1775755466; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tq7FG4Q/QQKaF2KEXQXUS/wC9EocSmykX6qtekYg6N8=;
        b=JTmfqWuTpsPxsI2RpD2trC0/zSB6S03PCpi71NsbCfm0nwoHsrVrcBopJ+zNz3QaYn
         URhsZ8+zZT+e2DppNcltR2wW4egmJSYWzxtH8DPvy9iDQmz2DiBuxlGCn8HW6wJvjnyA
         Z40N+HahqQQ1CVBJYR0lngbWt6aSHTPUcRdhaYMPtdH7GDV5e6HpMy5W1I5rXkvjQqB3
         Uo4ME0F0mqd7bhTZl77+Y2NHGEkduhA3gsA3kCIZKuFFS9lu/WD9VkD8HBnmy3Evxdsb
         S7t+yzB+dnwcwEO+r8qIS8T4X2gdjEx+VEw/LB0bz9KtfkcUstoz29qWL+Jylu0Q/qm/
         HmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775150666; x=1775755466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tq7FG4Q/QQKaF2KEXQXUS/wC9EocSmykX6qtekYg6N8=;
        b=qXPV77lxgIrtmlI4/kXUXe2B+eLqKqXjtd4rZ7PAXAJzuOPuuQ7R9o4CWwm9hkzCVY
         Uwyr+J+Wnc/3CWgcXvb9DYtN0NrRLOZ4TaZ72/UNjOv837CXZq08vNmqxImHeXsypcFb
         GmbqA1OSL6o1R7HpILdPAHNvL3bbZVzS81RQpm/8iaOFoJgdVFThSjM4KZFifIHoBfHa
         RoE165RF17zZiKBo7fHYL+Z9ha4JN/3rDMw5Fa0mTXohijUttCZetszaoxuvsLF7qRBl
         QxMKT+PNZi0ZMCt2DV3ggpVBR8VllmmmsxUywsdiFeSeXYmKabdRLqre5cpB+BSSpVnI
         px4w==
X-Forwarded-Encrypted: i=1; AJvYcCXsXdWqRiuV5sp67SUagCkr9npHvd8dIt+J4kCDNsaFF6IciHD0wEeWU35KV3K7+vSXyVyo9Kk9YfyYqbq/eeVC@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxd8vV4dQmSWi0Rx7nvseWMOKNa1FwtIF7DvXPzEMarJPrHzdl
	s2FcTf4WvchtB9Znc0TyhN7QtFb4YUNvLyYJIjafK9yDEECaH14c2k+c6RixA4chWOJ64RCpiFU
	puBd0OOts6QKWoG4FM2hg9VOrJ3GyalZzWmDGkOb/fUGtKnha9omhGcS3O/xFF8dUQrM/b3/dRs
	t+2g==
X-Gm-Gg: ATEYQzymltcczJeUdokp3VnH8nYnlYwkSkj0XJ5YrufaSVMpaO3oCkArTcig8tWw+cn
	T4MBeWnnQre+seyDYo+dYak8szRcsiyJ7iL1IF8yvfqdRLT/kdzK8E/Z8su4lrYr0Li3th+cuIi
	znK+Em188L8q/3dft2Xz3TwH8XOU0jnDEeKVNZSU5Npwo7ww1dFNT06vc84pqkWV5jC380Ube+M
	M6uc4lh0uM/7pnWzqUSmoUOY0nMR4A4r3vr3QWQdYYbZ9L+X3e4pcMmfsy6CavnDZBOUv/dCs/j
	WKiX4qBf5AOtWWsi9cvtC3PN2OqT/vSclkWRlAcaNPVfjze6Vf6GcSxm+1w3VBt6Po+9L2rAM/W
	nfpqwfHFEQ/j3pILvnJXb7X9Xcd03d8ioiUuMKEmxqtagw5TW5egouxQ/Z0OpHwZCTr0t1toDLO
	zjFfDBycLU
X-Received: by 2002:a05:622a:5810:b0:50b:4b2f:1606 with SMTP id d75a77b69052e-50d62750dbbmr3336251cf.15.1775150666314;
        Thu, 02 Apr 2026 10:24:26 -0700 (PDT)
X-Received: by 2002:a05:622a:5810:b0:50b:4b2f:1606 with SMTP id d75a77b69052e-50d62750dbbmr3335801cf.15.1775150665896;
        Thu, 02 Apr 2026 10:24:25 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d58e5sm11345379f8f.23.2026.04.02.10.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 10:24:25 -0700 (PDT)
Message-ID: <471ec056-3b67-4ed0-bd8a-9c4644eb8672@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 19:24:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] thermal/drivers/brcmstb_thermal: Use max to
 simplify brcmstb_get_temp
To: Thorsten Blum <thorsten.blum@linux.dev>,
        Markus Mayer <mmayer@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260402165616.895305-3-thorsten.blum@linux.dev>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260402165616.895305-3-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE1NSBTYWx0ZWRfX8Wf/PdiR8vAe
 nDEfzyDcHtmPQCuAuiiYA/i512cQDgRWXb05JtegUNnaIGsnSzs1fruy8jgWdqW3Kd7Y1j3luUF
 zmgAkAhJHVMVkbVgVMgriXZAScWn7n4S79zoiUGhAAbQMyPdau7tZuea641MxAEG5ofBDAHdlOU
 X+z94uSZHE6YfySRKeje2+sUxsjaDrwhRs8IIbMSkLj8+k4rSNnOKy+AAbsu37+8Arf6I/6zljl
 gzkQK1yg34OGdMhN8fweyi8V1N+4CYaGIWU3ESUeGkAHDDaioJ/KdxnhcpWNbZ7yXsaxLDWuTby
 dbnIbruy3twzsGenxmHT7wMwctje2RF7ytZX1fF9Ek0M3ISJypbKGzcTb+jtY0/yENnJjdhVO7p
 ++0PoM+Thgbx53CHtehZYuJ7vmIdG5AI+EMlOF1rd7eSCf216BeMjgzlGv84U+sMZlVS7wlnu7l
 opzpwOHEbMVPm+gd6xw==
X-Proofpoint-GUID: q_sTVzHK0AeVyVp-W1AfZJg5vnsAfc88
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69cea64b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=Q-fNiiVtAAAA:8
 a=z1V0bBGJbCNoM0m4n84A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: q_sTVzHK0AeVyVp-W1AfZJg5vnsAfc88
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_102429_045000_9EE5F52A 
X-CRM114-Status: GOOD (  10.27  )
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

On 4/2/26 18:56, Thorsten Blum wrote:
> Use max() to simplify brcmstb_get_temp() and improve its readability.
> Since avs_tmon_code_to_temp() returns an int, change the data type of
> the local variable 't' from long to int.  No functional changes.
> 
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

Applied, thanks


