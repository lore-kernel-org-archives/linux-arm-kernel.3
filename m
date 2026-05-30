Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B591CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 07:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpLL/bJKhYc82nklFMC3Foe+8nUBtL56C8X+bnVjl+w=; b=mfivXOcFKP+fwSjasFgd+YTG+9
	b8H9YZ02rFQMyHi4xudQpIlI4ET9fb2t5vZgCZdtfDcEe5VVkQ0Izp7+/8aFfJVlHCmlMsZvbaGOt
	Lv8oFkMyifNGFjL/8/83sBIGmScIMkNh3BQsT47P66mD7B9rmym9cXn9llHwuj2/xYG82r7qf9sYh
	lZ72tmauh2DOgslS5g/YI9LH8PtDLVfOe0041syZ9Wx/LUahxsLiKyaIe6CyyDIw8bw+/l0h1vo7w
	KPbUSyyrITIL2HwjX1DRUADM4UZqg9hwgtmF5h33S/eCHNTuVh/8L7Yjix5Jep1kVq/lMRFiWTVPG
	7LLM6k4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTDun-00000008VW4-22oO;
	Sat, 30 May 2026 07:15:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTDuk-00000008VVI-1sER
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 07:15:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64U3QRlv1400721
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 07:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zpLL/bJKhYc82nklFMC3Foe+8nUBtL56C8X+bnVjl+w=; b=gbrnMjF4LLenVLGs
	S6X2Wxwugv8VOgBYzORkSgsKrqYe1EmWqZEv6erzqnqaITW1zIjvX5VQKfdt4l3R
	9W6+1iIDi8/ft9A7CJ33GSZ0kIo7h22MvO7CT1UZOmroPRF7REfyin4FkQ6TtTjR
	8dcCQ27zjkni4WMh6YUhTRsudTa0EVc022w8io/Rm2tDIiDLB3xO6RkMO2TPpy2S
	iq3kkJqrv+kR5EW+YHKO+7ExMIfGQii3Ac8mqC9a8hoCHoSPNWTYPPu3ai3G+KzL
	IbTBB3NuW6QjSARj1fIBM707JJ/t4sgMPFC5nOOLS2lOagX9mEMsXRUzQt4s24+V
	gJDX/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqyurdsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 07:15:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516458449d4so40682331cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 00:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780125320; x=1780730120; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zpLL/bJKhYc82nklFMC3Foe+8nUBtL56C8X+bnVjl+w=;
        b=Hq4Z/tm8v1Yohc1NsG+kqkjnb2gWpgAPyJbfrqh5uvi8tIFSwwOKBqwAvat9e75CyJ
         Pn0iogzcdN3ha07FRavfwsoUaX6MqiQYpGu1k78LRvRl/tqsghuo3ODM1YvTntlDeHHx
         R2pt6dr0OmQm3VLq2RRZ+0ucjJgUl8OoHPFjsYMqc2cWOPvU279B+sXBkmbb37Re0R1G
         EjYUf5hJIrg7fFsuifrKPRJjkmA71NhL8CyyImzwbkkxfdc5GluC/zrnFaOhyfPV3HOC
         xeKrR1lDN2fYgcI+H3JvpVCMOF2BJHS+fb8ZMiEYXUCQsAqxna+sHonnPiH5A6pM5Cq8
         6GmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780125320; x=1780730120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpLL/bJKhYc82nklFMC3Foe+8nUBtL56C8X+bnVjl+w=;
        b=Xzor4gUKSL1Xg6egBoLxfZMwBMFlE8e95fChIyrp3NDQt9cx9B+6HQhpm6NcEvE2uI
         hnWiLYmfH9qqPdzuqpXduNBQ1B+hLZk1xlFXJDrKP1CSk+MlP+hwrsxR4rbH2UVlIWsg
         3iwKKtiz5ZsMaVcCI/Cd9eNuRiwWFbRcj/+vZRMRUQNEy3EYoHggoTWbICT8ZvWZVqOi
         zELGl2f43z5t/RKU+tNrfqkCaSLW2yMUknE/BXyhviIMoYxACkGDQaUGkY+omNKEVkyL
         +FivVBYPsE2pOocltXa4BB0E7ym7mGp+8ZDlQN7h4Vf8975+zcChWlL6qpkZSF2BmxLY
         K/Iw==
X-Forwarded-Encrypted: i=1; AFNElJ/ONvznqEMK9Tk0HO1Ddf5XFz+I5OHDcbvnTND97WL4T0DGFlcZByZlb9F1AWosZzlcH/TpMevG2fiMG8GHqjni@lists.infradead.org
X-Gm-Message-State: AOJu0YyazcbEbje6vrSQRZAwRivgA9rBhBVPjvfc4BOc5DQjPxxDpjTI
	Mua0EVWffTYbDPjIK8zTk+Ej7ESPFHSFePBsy24P+tzP+pBmg4Z9cNUhlp0sCbHnPS6eCUOldKp
	gHL7nqCEyZjBPcBEr86VFzGuvTHtPwcNGsFsOpMsr6QQ6GO8e5xDkwxxUh5HyU6jqFpsmwT+TDU
	u7kg==
X-Gm-Gg: Acq92OEeqTOOZcIiuUFbwqBzyRET/a2ULfxNrtY3CkOkKiTTXPnU8Wm/ZwryDP+RUjA
	JBY0bidpqUxVykh1D9z4gRcSA0JABni2Gcd7w6ecEFj6vGCb5T3vhiuWLlDVf4kQ0focenYZy4D
	PUJ8tEht5xwp8WlLKIpB61pX3XOEqmqwho8/3B/CVrbxwgc7k7t42I/3fq4JPUtV9HZ2uZjIFJ8
	h9P/Yvl2rPXKEDvTt6hzV2zpxRpU3/USc+55thzp4/VTDHYLxwc17y/ELTVg/l99JX84eKdbRpW
	RP3rs3LiHPbv8cvVioUjfU9vb6rTMjXsyDxaV9zJ+c1hKSt8cTfAr0EDsQWkM1f+gphx+yR0/fx
	aX54c3vR/5OfFLhIfR/WGmJhauEdfs2GVKhreh/QJb59EkAmJXHuESr0ZqPFrVDqwW/KTE3PLQm
	tJmJWbCiVh1vdNwAr6DlM=
X-Received: by 2002:ac8:5896:0:b0:516:e4bb:3bbc with SMTP id d75a77b69052e-5173a64a71amr36309961cf.22.1780125320173;
        Sat, 30 May 2026 00:15:20 -0700 (PDT)
X-Received: by 2002:ac8:5896:0:b0:516:e4bb:3bbc with SMTP id d75a77b69052e-5173a64a71amr36309651cf.22.1780125319739;
        Sat, 30 May 2026 00:15:19 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c13276dsm30282215e9.36.2026.05.30.00.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 00:15:19 -0700 (PDT)
Message-ID: <946af0af-6c4f-4e3f-9e8c-408b2c2b2a11@oss.qualcomm.com>
Date: Sat, 30 May 2026 09:15:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: meson: sm: add stub functions when
 CONFIG_MESON_SM is disabled
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Mark Brown <broonie@kernel.org>
References: <20260530-fix-missing-meson_sm-symbol-v1-1-3fb672b989d4@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260530-fix-missing-meson_sm-symbol-v1-1-3fb672b989d4@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDA3NSBTYWx0ZWRfXwdPHP6U7VTX5
 PUYhTFS6aynWXsJ7lQP98lHUItpcn5eS8VEGPZxRwC1yvgM5Wp2zNcXOfVEADV+QULpt2BRRD8R
 jxEt4Rx5yx0AVoyYCxjGMh0Ek2KvESv4nh4F/cUqurqxOPJERmstHikLh1Jxqatq//7jB7zyv59
 DsSWbtWvU37K9nNdOVGjxBRH8JTcGbY04iq/8xP3Anf85UBMfrSFa9NqfiDVx4GtSl5vIjnNuEG
 pfTVXswJBUkflJOiPN0r3JMFTkZ5qKlXlx0Vt7YERDIsQk0bnffZR/l74Ys7K3FP5BNvE/qP8wF
 +btHjY0PTat6Cgu8u2/gYeZ9HKb3MqvqI+Lld9z7un25fcFR4NaP0fXqgwwc51yR5f5JmErUSLw
 GQYTCTGlGXv7TsIX2CKOXTuGFeFnYlEv6GWLZYGvKBQdxES9uns353WOcvPGoPtlMXIyHSo1yAB
 elsLMFUh3sipQp+v94g==
X-Proofpoint-ORIG-GUID: rWgJQy8m1bZHKkguwOBQkjHG94gRyupf
X-Proofpoint-GUID: rWgJQy8m1bZHKkguwOBQkjHG94gRyupf
X-Authority-Analysis: v=2.4 cv=B5uJFutM c=1 sm=1 tr=0 ts=6a1a8e88 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=UWCdJKDxNioY7VXa7sQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_001522_680846_9ED1F5FE 
X-CRM114-Status: GOOD (  12.16  )
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

On 5/30/26 09:05, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> After merging the thermal tree, linux-next build (arm_multi_v7
> defconfig) failed like this:
> 
> arm-linux-gnueabihf-ld: drivers/thermal/amlogic_thermal.o: in function `amlogic_thermal_probe_sm':
> /tmp/next/build/drivers/thermal/amlogic_thermal.c:196:(.text+0x2f4): undefined reference to `meson_sm_get'
> arm-linux-gnueabihf-ld: /tmp/next/build/drivers/thermal/amlogic_thermal.c:205:(.text+0x320): undefined reference to `meson_sm_get_thermal_calib'
> 
> Add inline stub implementations of meson_sm_get() and
> meson_sm_get_thermal_calib() behind an #else guard so that drivers
> including this header can be compiled without CONFIG_MESON_SM .
> 
> Fixes: b21d88de6918 ("thermal/drivers/amlogic: Add support for secure monitor calibration readout")
> Reported-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---

Also added:

| Reported-by: kernel test robot <lkp@intel.com>
| Closes: 
https://lore.kernel.org/oe-kbuild-all/202605291530.en7aGn7w-lkp@intel.com/

and applied, thanks !

