Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEBDF557F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 09:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VacLWHx6mffMprulvbIkPw32rMmqdQ4bA7Snxbp9Tk=; b=MczDuWA4RvUWdeuh025EbsGjyY
	FK4HAyzla9FFYKIuqpxt6I6DhGvLyvvNQsIxjBLjPXsq7HdHRohO5RTeGDm627P2KshOFHV6C5Sb1
	22TfXa/d5F+XHW+tI7Bqa7wj2lJjLC0efhd1gkhRoxz3KJ8uyc1SsL5XQrHWFm9pvlWUrCFtmpvAM
	F4VAd+5I8Y5jPLZ2WF4n5sLHC5Ci75aufk1OzI/2IsctGwDKsnW3nDY67osM1bG+W6hNq9B/umZoe
	glKzYos7MAG3iaDSYbFCFncfOTrM//HigrzropPUQ/xnDQDcen0yGZNqw382CXbF/R53iXvJdRkiZ
	hybEdX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkjf-00000006f46-0QYb;
	Mon, 20 Apr 2026 09:16:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkja-00000006f3Q-215r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 09:16:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K91QMi2281651
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 09:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0VacLWHx6mffMprulvbIkPw32rMmqdQ4bA7Snxbp9Tk=; b=WkjoQzg2kqWzA18F
	L6HAtHTpaO2CnNqgdbGotdo7MjqU+UkURHw3HDNRTwADiluxEpeXii9D7xNeszLM
	IEs6FMzoc53jEmRJZb61ZGOrBTjjGblKsDbP+0GZSeuYmyp1cv9gGG+b2VmkwKIC
	Xt3VN202SI9nQeW6M3IN5HDGtPt5GphiS03suIm3kQ1pP2Mj8UDOGg3N1uiFHlM/
	emwo5miPIDLBj/8wBqZUZWwrXHyhocldi2ifrxF8MJddhIbEFhrVFHWcuoy09xi7
	n9YX7074jVz5JC2mrqHrDRkznWVoS/+UKzhd99GvOTdW8jE1MeqYeXSmt4XAzDVd
	vUMhpA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh598282-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 09:16:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d63962d83so25707461cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 02:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776676560; x=1777281360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VacLWHx6mffMprulvbIkPw32rMmqdQ4bA7Snxbp9Tk=;
        b=dHhXHALs8ZFnIontJUtWWUfpWC9GKC8jWa1jHYjIiLKegDni7xKjlCNnDLOZA7F2pX
         pPk0Dz8E1ubChISzsVJf3uDGBhQn/L/6vfYPoA0MUtP/bWx007kp3H8+TpjYywdL78AP
         c1WZoivTTctuRWjOg/zrTqHb62WOz1opJmQnUXtmyIimM9JIQJ8Wd8IC3qS3qBJRTxyi
         ecPEfcL7B5y4C2kugryQ53etb9SpCiplCqmp/96XtrA2kXhZd4nCC6Jjqv4Q444ucWQe
         M6NX2xfPyOUPAAp2nPvokhrj6picRHpCboy+Ae6HjCc4rblAj3gIL0WNKZIkLD/MLFWd
         bB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776676560; x=1777281360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0VacLWHx6mffMprulvbIkPw32rMmqdQ4bA7Snxbp9Tk=;
        b=Us6wmQakRmHtLX/xuM9X8X6WjMw+GRI9pFXg8WjUqdlxEm1pfkDNTHGZvfzI2kQ6a2
         8UOdseioNmC9TYtCQjpxaAIjKtpFsEm80mWTByuln6E5v5H5Nyvg02qncrNhoXOqVCp5
         IhFskLij74P0kAwLiu+AS/JhnrUWIxdZK+kFpVL7EmNbQWVwago93xUkR+2Jc2n9vkqg
         4Sqyc/UiQQADATnGLtCnSY9+1Wzn7be2sFj2ogL8oLU5kFM9kcZ0krBCRtSY3l1K7AMV
         8ZVW3JeLhvw/+0oA0no8v6ARfte8nKefPGMYPVEOCW0kQNJHIOJKm7XT8el1burkdBQW
         kqcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xuPwQX/3ioCHzbPHEglEOevvYdP4GXdiJp36AF3cXCkkXhZzF/s0Qn++nzNGpmt+8ZeVX///StrzIuJiKPyhp@lists.infradead.org
X-Gm-Message-State: AOJu0YycUuMh9ruwu4y86BogBJcg/Ws3IMBpZGzzhkq4ZaDpRwIMfAmv
	PDlIFo7yIYDY+8HMyGvoizDZbW05BLel6IE/L0umBSt08p2biZJUM3+dHjAT8Qg7FQLAAzJH27l
	I/N1L42D3gRXjn6m7Vo7o54iBm0xYTxLkmHDS8UoxUjiufqnu4LsF3iRul08t3BrDbHcQO37ZF3
	omPA==
X-Gm-Gg: AeBDieueFSZXZVuCytQv2cLzYkql1+5xKORfAPfoHRPB/DFRVC6ctDIrHaZ9wQvGBJ3
	kdlBHGrHaJ7dUByTDu749JA4esanypCoA5Z8s41gNf15RCHgW0hDEtlCwgc+vSS2IVIwz/IW8dp
	MWxNZofj3GfQ60fjCmNcR9xgVi2WCngAMC93BQQ+lKFuSrJFb0mUcTQFxuTyXRar0yMEA9A1LSr
	yKqLsa7yCMKfOgpT0N0iALK4Kc3gZGOH4YcD/WathI5Cg0cxUUXPSe/0Un/klillkUIbT0RG3Q7
	B9xMJvbDzcCBzQ0POePz8PqbtqqCOsk6/3t0kvxI1TOqg4tnaerb7MLswaOaa2+4/e3/HlbG1eG
	JOBfgO0c7Qfz3q9AUmtow0f6NT35MDSMYgKeyAo10wQBcihWt9Pk5G8RyvrE=
X-Received: by 2002:a05:622a:1305:b0:50d:8db0:7abb with SMTP id d75a77b69052e-50e36ecfca9mr193000841cf.42.1776676560343;
        Mon, 20 Apr 2026 02:16:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1305:b0:50d:8db0:7abb with SMTP id d75a77b69052e-50e36ecfca9mr193000561cf.42.1776676559914;
        Mon, 20 Apr 2026 02:15:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:776:c20f:3f2a:49a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4c221cdsm27457471f8f.0.2026.04.20.02.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 02:15:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: aspeed: fix AST2700 debounce selector bit definitions
Date: Mon, 20 Apr 2026 11:15:57 +0200
Message-ID: <177667655421.14099.13456882135654197877.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415-gpio-fix-v1-1-b08a89b31e6f@aspeedtech.com>
References: <20260415-gpio-fix-v1-1-b08a89b31e6f@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XNnL2lil08JYCacouXiu7SrBZuNH31ng
X-Proofpoint-GUID: XNnL2lil08JYCacouXiu7SrBZuNH31ng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4OSBTYWx0ZWRfX/Qs0p6lxbgGS
 a7cE4dXiPwzacD14SGA5Qlu6GkERlXub4mrFLm+kbmum/92GFxxi3g+8UgU3OHqCbI9Qkj7zfyX
 ODVDmBLzsvFX56rxnIa6zFaEzyFcgWWQwEFFyRb+xkhzlO6/7apf7B50yDtQSyrnaQ/TzzlmP4x
 PBQ6fu1sTA3D1rQMS/N1M5OsSZfITv5Bm9YmGLRoKuI/wQoFFhREsty4VCwFnjyCalA/c82f+k/
 XfW0ETGWn0iHQgGZ08N76Rc2MGhDRFLnZqmimKScgBUWiCXlm7VCzW906g/FpHwtF0Rwu+ovvJv
 VVOAAQNycDNyCWfP4olAvreTQzJbhEAHmGznbOpm38ChxyBzuRa/Qi+LQhW4vtyppgm95fUVdLG
 c06NY281HbqbSoNAezs550RrlsSy0fHDt62CN4ZbH28WX+8dab5j1HPBp+jhPKQkLq3J/BlkpPf
 YG8cbZX5q8erOzyYlCg==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e5eed0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aUlvD_2W9BlSwx0EIeAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_021602_703719_3600A7E8 
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


On Wed, 15 Apr 2026 18:24:42 +0800, Billy Tsai wrote:
> The AST2700 datasheet defines reg_debounce_sel1 as the low bit and
> reg_debounce_sel2 as the high bit. The current driver uses the AST2600
> mapping instead, where sel1 is the high bit and sel2 is the low bit.
> 
> As a result, the debounce selector bits are programmed in reverse on
> AST2700. Swap the G7 sel1/sel2 bit definitions so the driver matches the
> hardware definition.
> 
> [...]

Applied, thanks!

[1/1] gpio: aspeed: fix AST2700 debounce selector bit definitions
      https://git.kernel.org/brgl/c/e31eee4a961077d60ef2362507240c6743c1c2ae

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

