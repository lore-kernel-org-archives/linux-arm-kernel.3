Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AE3C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 06:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aKPvfZM58gWA2EaVlumqwxLg4OnLhGg//o4cfo9NEw=; b=hpOaUuiCJN4qkLEEVULLZVj5Z6
	tliFd3gdiQ/7L/CpY9PJpaABiFqscoJ2l08Yn9FGwWn9/jgmHCgQLBvRMqstaItj4Pxe9E8Ftbq4m
	mHD29XL/ZKtxidKx3LZigz0hlspFyX3EmlzPyXKePHvgWkCdsmYjv6TIRFwfls1AKko6Nk7OjYy9L
	O4/AgJJ183nSvUzRQi+aYckdvXRskU7YdBtZdA7DaorSMmEnhe4q3twian1k9fEIm7Daf23eKCg14
	7WPwhw7PG1uttZSwvtBtYXc3e3GlfmVlZ/WusApibYGylEYDO0CkCEr9Xl/t25l6CeTDQZ35dQt2i
	2R3F9cVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Yi0-0000000DZmL-2irE;
	Thu, 10 Sep 2026 06:56:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Yhy-0000000DZlx-1FuP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 06:56:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5H0mV520701
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 06:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4aKPvfZM58gWA2EaVlumqwxLg4OnLhGg//o4cfo9NEw=; b=JVIO0I+ZwDlKHM9j
	D/TeQvqZBmIEW9WUiTGLQ5qeeqjgQPsQkJumGssyryITlk9QBUx10hJVFql8vNL3
	9l4GCWGxhCUbFNApr89KsneusjCZJVGag/jknTuEBdaA9CmXAIaTKAEeAAKHulrg
	pIbON/BCRy4/HsG9DdgxhSyCbFYWZ6oy9cZg5m20efgKhngdoWIwrEK+G5tiJzG+
	iFH37RSVkFj20VeObSwGIaNmg8KtiRBRWsGgar7g6hfuP/xgWRCttJlFWtbIewnF
	rhWHGck2OZHYcGU0afhUagZ9M0Dl0lXYakAl2bmBlnwhuyej2dKKZlTbwAiADboy
	ofslXA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygjgrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 06:56:27 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6710c7f5f21so2822126d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 23:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789023387; cv=none;
        d=google.com; s=arc-20260327;
        b=geHPfErJCLV9qC1EZtflbaT40Qv1+dnMx/krvIluEMeFmADVrCb6ixZsBNXovgNXBq
         HpiL95FWa0ItWT3HStVmevQLFpj2/0lwipsUe/mKri6le0DzUbeOJKYOpzoAPt+qiWXK
         e01Z6d1kEVuy6Mp7eD1AradikpsoM1MzNztBBrQCs89qsg3kCR6TDP4X0ASVTzJNHBzw
         tPN3sv5lBO478Po4GTwuPF8qdo8R0SWa5bMOpyMIAmT+hs3/faWhYm2QMRo+SmShBgzX
         atbLnS3WytdhN3zmijrMhJwKDfz+zB3YMHBYuf43Uik353awO+mXUNlZvYkGizwZ65so
         O5hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4aKPvfZM58gWA2EaVlumqwxLg4OnLhGg//o4cfo9NEw=;
        fh=LMKncej3NrqdoQ/mOzzoTQMPn7oZn6rjUHkWwVUkD1U=;
        b=Ep+9A6Kny12S8mKFEeDv54wL65keaIoV5MuFXf3Y9yAPmOF79luCl9sSuE0YIZuq20
         YJlhVSMo6kxeS0/bnFVR0DeCyVtL9/wehTV+KJRUPBfVowiGarorvKIMUB/SNBT/gWci
         DaxFkGxRKkWe8EUWkTUF9YWHejyLk6iGN5qTISLjaogxDWEydz5hTAfby7gXmC2QKDSc
         OmCLJY8Q7VlBYtb9cNlq374T9FoQaF+RENNJBB3x+Tl5wmEt3zmtmNy3yMJXyBaGfx7y
         R/RhbJoESezaS2XF4ZfnDLV4IkCcwvhiXjpd2FucBrhPjSwNSrg60N5zXFI2BairASXB
         tliQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789023387; x=1789628187; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4aKPvfZM58gWA2EaVlumqwxLg4OnLhGg//o4cfo9NEw=;
        b=UAlvb+nQw1uI7PohZ4bwRuWEeSj7wWJigjoOaVv0+5HNDQUxC/IwHQA8u5bbAaR8hK
         Lkfg5wO4xcsn6xPfF48leuqfe5zGEYYTI8euWhNHRt4VivYHv07JWNnE93SdVtkcSf9O
         m1oB0M30+IAiGFdAPV7emFthvD2r1Vcn7A3SMhKlJcDohLNsVh0QKLgjFAI0jrESpo/L
         zBM0IwGkkT7MBf3LAR6VjXmDQBEGT4+2iOPPhUkHAIj77zKGMtxYelWgovf0q5K1mzzg
         go1vS4iMVdyaFPKNS8/51W50r9AVs42pk/Y0rE8N2RTzHdbhLRTTNQrsvYp/bdpdxtrC
         AdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789023387; x=1789628187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4aKPvfZM58gWA2EaVlumqwxLg4OnLhGg//o4cfo9NEw=;
        b=ieE50pnhA9HoggSQMgYn25ibvrr6cT10UYxMV7qRQha9cG5ufywdVkx6a3psYybW3s
         hgl/2azw2hnVJCkPI5EgoGREPaAaQVbAzYf6giGezFx8Y6mfYvi6PSXsS3VbRnHRaFW1
         Dsnjl+IXBLH4cmnLRrhOd18+cvBtc/EzulOCjxrdgDgh1rbtPqGJRA2ucKHebhy/63gs
         jrgajjzmXgyYT/G9fK5DfT0pf5PRiUHPiKRwOReVpHe8Rc8XR+nTwh9Xd+shKWROyKII
         tDRqszepGm1QLZqIpTiXJ9mOLYrLJv3ZIrAzuml3nCdNw4VSf7rEXU2x3qmNPujLEK2I
         uBCg==
X-Forwarded-Encrypted: i=1; AKwUvBxrZqcwIdHyzTpiPB2PsYgiQKjWJKgsA63PiNDqXHM2FLYnxd3E60O7Q2BhNpZauvSpA1d/QWA1MhFnPwnzkpgX@lists.infradead.org
X-Gm-Message-State: AFuF++nLnzC7cU//qve78UQPk+Ks12Hr1jjY3D59dJyWjfRXliKvGV4D
	Qba3JPI6hmpLsfvhxivh9zO7scAaTrddm8PM1IXPFU9s017myjem+7PJtU9uBQGniWUoHxtq/BH
	NJUuRLGxg7LjJU1XmvwTjjP33hICoLVhTzx7nCyK63y3678MyxJsDpDPu79wSmqufuJ9eW51gND
	kTg4SwrBlrVwR58n9sFzUlTwh6Lyn/IsdOok/EyBWEIKSASBp0KJk/
X-Gm-Gg: AYBFou0mEa9Mc/OstxFYYnjh9dPrhB7ibnm0SygQjUy0l1+GQPEm0IC321Nz38aukAQ
	3b2Cis/mhDsRgl2xMnpmXpiH2YoQ+gp/fcMHClXxXnYLJB+U4YKGaGTMKFThVCBhCbjGA8UTCPH
	/CA46E5A6UxVxNh6jycifNuhS6UPMNUCwsX8NjWFqr3C0Vy/b6FTPPg/9g4g==
X-Received: by 2002:a05:690e:1381:b0:66f:d093:c206 with SMTP id 956f58d0204a3-66fd093c2bdmr9267284d50.17.1789023387560;
        Wed, 09 Sep 2026 23:56:27 -0700 (PDT)
X-Received: by 2002:a05:690e:1381:b0:66f:d093:c206 with SMTP id
 956f58d0204a3-66fd093c2bdmr9267270d50.17.1789023387057; Wed, 09 Sep 2026
 23:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <888efe8e63b6a18fae4acd5a90a1e0e69dcdf2ca.1786012495.git.geert+renesas@glider.be>
In-Reply-To: <888efe8e63b6a18fae4acd5a90a1e0e69dcdf2ca.1786012495.git.geert+renesas@glider.be>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 12:26:16 +0530
X-Gm-Features: AcwNN1XL2UjMnNz9rSDQ09SUEB1jM8vYqGgIh718AFVmKu_cGWQR2wlTCqQPHEc
Message-ID: <CAGptzHPbPKE7sQXfePGLH7_qVL8m7ihQYrB+L7kXR0EE3FMzsw@mail.gmail.com>
Subject: Re: [PATCH] firmware: QCOM interfaces should depend on ARCH_QCOM
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3MyBTYWx0ZWRfX4Zt8OYD0J1NL
 in7q5bqrMqF3yUmcec/92sWKANOxqAsfs/IzhYrAT8Kfn91UPQmKGoSs1LVzHQFrISSGWPd1a6o
 rT7/z88B/GnSPvSXiAkCF7MiGLxslZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3MyBTYWx0ZWRfX7Bw8IhVXxZUQ
 AF8ymPx2EHrx9DOdTkF1JUA1G/NYrKtfVxvaHXhtN5c0knCx9oSvoUF+iQlH7YF1XpRIPximaMF
 Mo8MCpuV72q5YPe339Ko8Quj9B/kr0DnXgGPbc1QF4zMtkhnHqlPmkgWZlb+1QUnNs/NPHl81YM
 gKso2aXdorKEY9hMkkbipvwKDTAN2Pp1f0PG14p1vokUqCGYGzi4gFWUSDP7aHySrsUWWzTay/W
 No4gTtSd5mn93tvsjoR7A0HZ31fprsTdiqzAoB/Gjd+6JrLoGmpAfqKjH2n182opHAmevCn709p
 P884OaTlw7b0Cay2wvEXdHpErO5OGhqupH4R/Jm9GNgIey+tIaxuKyt9K+LpqzqvoT3cu3H6xQg
 FZyfs8w9aqJqF8cYAgWhGjW+zY/qoJZDSh0n7YtN7hukzyNljikH7/LRBoCDc1qyPTlDw6tLV00
 vK6NfVnSkRPbDeqIlyg==
X-Proofpoint-ORIG-GUID: Jg5HKO_SIVQLpDppscY_s1KZBa6T7VqO
X-Proofpoint-GUID: Jg5HKO_SIVQLpDppscY_s1KZBa6T7VqO
X-Authority-Analysis: v=2.4 cv=Z/F5j3RA c=1 sm=1 tr=0 ts=6aa2549c cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=rMNxEFciD2boAfdi9R4A:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_235630_453271_DAA52B60 
X-CRM114-Status: GOOD (  24.10  )
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

On Thu, Aug 6, 2026 at 4:05=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The various Qualcomm firmware interfaces are only present on Qualcomm
> systems.  Hence add dependencies on ARCH_QCOM, to prevent asking the
> user about them when configuring a kernel without Qualcomm SoC support.
> Make QCOM_PAS invisible instead, as it is already selected by its users
> when needed.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I wondered whether QCOM_SCM should be made invisible, too, as it seems
> to be selected by its users? But apparently commit 5c1a2975d23c51c0
> ("firmware: qcom_scm: Migrate to generic PAS service") in net-next/main
> and soc/for-next made it visible on purpose?
> ---
>  drivers/firmware/qcom/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfi=
g
> index c7f8413ab996cf12..691db0ded8e8cf63 100644
> --- a/drivers/firmware/qcom/Kconfig
> +++ b/drivers/firmware/qcom/Kconfig
> @@ -7,7 +7,7 @@
>  menu "Qualcomm firmware drivers"
>
>  config QCOM_PAS
> -       tristate "Qualcomm generic PAS interface driver"
> +       tristate "Qualcomm generic PAS interface driver" if COMPILE_TEST
>         help
>           Enable the generic Peripheral Authentication Service (PAS) prov=
ided
>           by the firmware. It acts as the common layer with different TZ
> @@ -16,6 +16,7 @@ config QCOM_PAS
>
>  config QCOM_PAS_TEE
>         tristate "Qualcomm PAS TEE interface driver"
> +       depends on ARCH_QCOM || COMPILE_TEST
>         select QCOM_PAS
>         depends on TEE
>         depends on !CPU_BIG_ENDIAN
> @@ -26,6 +27,7 @@ config QCOM_PAS_TEE
>
>  config QCOM_SCM
>         tristate "Qualcomm PAS SCM interface driver"
> +       depends on ARCH_QCOM || COMPILE_TEST
>         select QCOM_PAS
>         select QCOM_TZMEM
>         default y if ARCH_QCOM
> --
> 2.43.0
>

