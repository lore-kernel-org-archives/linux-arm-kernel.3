Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5967AD31A28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nt+v5a597nWZvp3pNL1VjLamfWdK1drirILdf/lmL7k=; b=BF/MKeNoyYOZCAw3iOLnBLGJdd
	+2S6utHWANUQvWj9GvzBxpImLk4ygJIYtKXoHeWrl8hBNjOlwRgifxA8Cnl3bvD/I+SA/w/Z5zlwP
	lTCLpnDdKe7xZCpnflnzQLxvsTrlBoFKEMqiFbXP3axJ8x9+dDh1EEY6X6kKUfLcy3sKDrZ/TmEbO
	NcyGEnroM3FzlLmlQzaCrab+BXL0IGlwElWP37wrS9XvMNMadqRugp8YDfmLkxc8Og1dpnqXb1sFE
	U1QrnXIxRU0NvIGpBrUxGQlq3Fl4w/oTkonYnCIxyk033wMWR52mZInk0Q4qBNeDf6rvHUX6nn7ku
	1D7vv4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwN6-00000008Mlb-2Dgs;
	Wed, 14 Jan 2026 08:36:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwN3-00000008Mke-3uv1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:36:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jI2s2841513
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 08:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nt+v5a597nWZvp3pNL1VjLamfWdK1drirILdf/lmL7k=; b=k8vm6lriMwFBRpof
	bNqrG1RZvya+3JARtfFQheYF7eys522hsjAjO2hU3PAmcAxoBEEWpkoLPX4qHBHK
	6YV2AuOLcA/AcUjh5nSGQsLW7xNHGhvpV2tilZxMxin/PrAkcuGOQZ08vZpx0ehi
	ZHeWyRw9gHrJn0xX96Wb8DxhlbReKKYVc9BjEOmGcp23oJ0szATOrI6IdjVJ0rzy
	zX2F83rItaZPbtvnYfc0MN06Dkt1I6QogmhbKKqpiPRKHBGNDK3Z2kn9b3OJk9ks
	dDZjO2kjlnVrfvqzEFDpjCOiQUYxkVwE/D9DK1QTFOBicjBZU/9qgFW5dNrpxyFG
	arATOw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnuk92h2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 08:36:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a090819ed1so57007965ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 00:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768379811; x=1768984611; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nt+v5a597nWZvp3pNL1VjLamfWdK1drirILdf/lmL7k=;
        b=hppoav7uFIpsQcQ3ieYWEZJfO+GMSXAAwfQwVprTzBge2d9nLFMBTL4LwDzo1f2tp2
         dA7IKnfIiSWj/Rjum88X6/+rDi0fKuaVF0BhXEXoxhyworGQzlTwYIeD5eM7HwZz4hI6
         cXDyzRX51pUvWumSTey7IlIriTUZcqQTyuDxxKY86J6qmpkO5e+jEmZLra2coFLhcl38
         wBVqFX+EfmSmteFSCkV9tUvM7+xCpeiPBiArA4IH/o4zqrK9Hha/7Xrrl5TpULYtlNFs
         xHfD4aGsMrVj9RJsEOoLzPIOBETEUExPH+qDmFKBlfHsL2ib5RzDvSbTV5l+bcLsLNbx
         IzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768379811; x=1768984611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nt+v5a597nWZvp3pNL1VjLamfWdK1drirILdf/lmL7k=;
        b=AuoYAE47Kt3hcU1Ru6GKtbFb1pBdxsH44I9QE+fWWP+T6fGZ0F+eSL8S9waoyha4d9
         ZKDabVJtICiVp6t4Bcv79BHd8Rqd/t2xzKPV5h/LYpTGlGiHcFXZ/guyp5mWmL6YMLbl
         4O/PXLgspkiDQYsYMkX8PViXQFjYbFjSwRhHpTIvKjpUSNkCka/cFG1iBSqxpUoXSUY7
         e2CXQqoI2nj7f/2Q0pY9oFrwOk5z7TrtQIpVhXuhScwBcXhpRgWl4/QLXMZSynooDm3U
         /3lTh4ge53p35s8kSDQV88nJ2jF4wj6XWGBdCdDTJ8KbnmRE5U8/I56sZzLeagR0m3e5
         mgoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNaympkA4G2hEkDQHKcX3+6dftFZmIyclt9Xw0iYGEYtPgIane+owayFD1R3hRV63j4HC4VAvXiFhDIw1uesjJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3rfhJktGFzd7WPpvk/8azOY5BEQYQwOkgz6ynShrI7pBWvhfe
	Sj44dexxpzQO2mosY8HT0IWb2CmGE8BJJy0uIPvUngp6Q3hWsO66wVb4T5oXabCUEDdK3I6u08t
	WLiGxkF9y5o3+7NVhbI0MfrMnO40+PPk0F6v+kRWmJYuCZDK4lWCug6EJBHw2tia+G7L54soU2a
	YsXzEX0LZOVQ==
X-Gm-Gg: AY/fxX4NrjaT6X7LqwWGlW3ffufIPQW/Z0eP1J5YPYOGi2+CHGjX6OtrWE7vnqRrwb1
	uMUPyYVbzw6wX+hlFe7LgfSN947HTmEwNT+TghDfRCP3KeWnBZoiKCJrafBfQfKGAgr7U1jESlU
	5V/QfpvjyzufBBCewpKkUsw+DBm2WVTpv9MjA98VfTERY3V8RDHuQQPXZmYT8I1Qzem1sAPAN01
	csYvnwKdxbgi0NZWo+2OA8+nHMZCtkChu8u7Aiz9tDygdMoUvYRYSsFKO/A36kiTRdIBJRV3tyF
	wXIShcs1xRmpaPx/ca5PbAFlcJsse8XO/N60fzHnRPPEgfNICYineW4TA+gX20tUNmcG3evcav9
	1NbKApHS9FhvbjQ5g21rqjziUxdvh6feIEnQDWpUxFcOqG5qz4NTeumqifKekWlAXyCJEwhE2T/
	aN71Bz
X-Received: by 2002:a17:903:124d:b0:295:b46f:a6c2 with SMTP id d9443c01a7336-2a599e7789bmr16961855ad.37.1768379810767;
        Wed, 14 Jan 2026 00:36:50 -0800 (PST)
X-Received: by 2002:a17:903:124d:b0:295:b46f:a6c2 with SMTP id d9443c01a7336-2a599e7789bmr16961705ad.37.1768379810215;
        Wed, 14 Jan 2026 00:36:50 -0800 (PST)
Received: from [10.133.33.254] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4795fsm224405075ad.33.2026.01.14.00.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 00:36:49 -0800 (PST)
Message-ID: <353699b3-f52f-4550-b428-c57f5d5fc2cc@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:36:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Mailbox changes for v6.19
To: Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CABb+yY0Uvkc4g0=gi79j+CCJzKkeuHGD9u_6P5ScAFkNS0F+2w@mail.gmail.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <CABb+yY0Uvkc4g0=gi79j+CCJzKkeuHGD9u_6P5ScAFkNS0F+2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ebQwvrEH c=1 sm=1 tr=0 ts=696755a4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=TUEyidGdqAj2PqY6nucA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: E1ZoIXV-t6h8La4fJSFYPGHQOHMoLqaw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA2OCBTYWx0ZWRfXzZY6uR+TvBVm
 EPLOmKEUdTn8tuxXjeKjpZumVMZh62gwzugJd4QN1fuzquE55I3ku+ncKYHtXbKNRSCQxuOhRyr
 tIeQY7W4+Hvh+1QJfE1U9aAGCGHC9lidECJXcAfmCCG8Qhw91v4yPSr4GV/fOaFAWu9HCKMXE3E
 9E9XYqbSIeojR7b9W59l9SgiuDggmV+geyP5fyo144XZxWzPz7rQ4dscV6JZrWaphKQeScX7JNb
 eTsJaJSt0qpD2rEA3sSkiarx1rfz4qhG2Q7E1SOEflnaMD9RbLLnO7UbyL4n5qNevQpJ4WFzl1J
 z7zW2C/RxzYFSnxwGppLvDIa9S+v9sIgDie/K4DGVH0wo5EpLXWH6iRsP8yOWtz/a8QsXaMtGJs
 ZYbypygtiAXLrQEwVXWQ8Yud0/bj3nQs+hxN/PSTSDjFFRtlWfZMGxjh4HS9frlOjJHSyHMZmPk
 QJ68GDl230lcH3AS4Ug==
X-Proofpoint-GUID: E1ZoIXV-t6h8La4fJSFYPGHQOHMoLqaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_003654_087478_D9FF0D47 
X-CRM114-Status: GOOD (  16.63  )
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

Hi Jassi，


On 12/11/2025 7:31 AM, Jassi Brar wrote:
> Hi Linus,
> The following changes since commit 7d0a66e4bb9081d75c82ec4957c50034cb0ea449:
> 
>   Linux 6.18 (2025-11-30 14:42:10 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
> tags/mailbox-v6.19
> 
> for you to fetch changes up to 175956b6672f93491da9c78d686f310311f0855e:
> 
>   mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa() (2025-12-10
> 17:17:01 -0600)
> 
> ----------------------------------------------------------------
> pcc:      refactor and improve initialisation and interrupt handling
> qcom:     enable Kaanapali and Glymur platforms
> renesas:  add MFIS mailbox driver
> mediatek: add mtk-vcp-mailbox driver and bindings
>           add support for MT8196 into mtk-cmdq
> misc:     mtk-cmdq: Remove unsued cmdq_get_shift_pa
>           remove unneeded double quotation in Kconfig
>           drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE
>           fix out-of-bounds access in mchp_ipc_get_cluster_aggr_irq
> 
> ----------------------------------------------------------------
> Conor Dooley (1):
>       mailbox: mpfs: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE
> 
> Jason-JH Lin (5):
>       mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for
> generating instruction
>       mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
>       mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM transaction
>       mailbox: mtk-cmdq: Add driver data to support for MT8196
>       mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()
> 

I checked the 2 commit below on the latest tag, seems that they were lost
on linux-next tag later than next-20260106, which will cause dt-check
regression.

> Jingyi Wang (2):
>       dt-bindings: mailbox: qcom: Add IPCC support for Kaanapali and
> Glymur Platforms
>       dt-bindings: mailbox: qcom: Add CPUCP mailbox controller
> bindings for Kaanapali
> 

Thanks,
Jingyi

