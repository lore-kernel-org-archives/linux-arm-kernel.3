Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C841FC72A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 06:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1jfkKoIoyOx8Kv10DppX+EOFqlkSt8Sl6eKNbUG7kA=; b=PqJpa0OZjQUe0SimNvz1TysRr6
	hOiw/LFVRCX1I0RKDo2JNlhva0wI1sQKHDqcdbZKI98YRkErlL365h4+2wnvV5Zt3Q5/qczzrox3k
	Lur0L7XlXwDLsdAkNLoS3hSX018AkeBjWJBFFGM9FygS72AWrpgouwgzcf6UdXOj1O3syanLMRt4P
	U5R3XYIxArFMVua+aAIALMuR7j6qm/G5ChOw4ZSlja5apZT500HIpQqiFc+/GJn7dqe69Erz60qhZ
	8GXU5xXcC4d2UEoQvDiqiLPI/+/7kZRH32u7pTiOJYPNOIDKpBN22+9NLhxdMfoXZSeazyNP3i6Ly
	OoIy8DDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Z5M-0000000G90a-0bip;
	Mon, 23 Mar 2026 06:48:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Z5I-0000000G90G-43tp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 06:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774248499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A1jfkKoIoyOx8Kv10DppX+EOFqlkSt8Sl6eKNbUG7kA=;
	b=c3QJpL3NeGtEOH8s31KlQy0gLYg8Zgy0nCbCtuuL2R9aiCEObPpRsGGhWv1jdQFa+bi0zh
	wpaWH35mSvUKTRjaQnNXFpBO8Gb5o8oWMV72BtbbKlf1sDfqP8tnVG5L2Vd7RA71abwMhb
	TfMbB5WkwE6whM0uHJPcFh5dKqMJbVs=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-jcy3eApWOnexkVwrp5PekA-1; Mon, 23 Mar 2026 02:48:17 -0400
X-MC-Unique: jcy3eApWOnexkVwrp5PekA-1
X-Mimecast-MFC-AGG-ID: jcy3eApWOnexkVwrp5PekA_1774248497
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a1e725a8fso19167210a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 23:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774248496; x=1774853296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A1jfkKoIoyOx8Kv10DppX+EOFqlkSt8Sl6eKNbUG7kA=;
        b=Lj5XZutGmKo3VRW/An9AorDH9vqWxx+RjwUzJzexl4j73Pisx2owxGO+NqI0TANjR1
         B9GyAASuJOXjUO6cUvPymdpa4bmmtTMvP18h/K+XVECPdK84DdOyMHr2104DffP1BCh/
         qwdIZWv5rXQs3LPpQmvOI1Ag2+Swi/8Nl0WTJYjJSfnZBHbTARixomyVfsUV/zam+REu
         G80lzMK1Ic/F5oYaxKlnFZEjwnmRUTX2flkPwTGUnz0reExcmVBPN4Rk/f0ZSRN5pZUr
         xrd5SsQ3aOyEKd6a4AABo9V5g+aSdXRYmKp0Xeg2x2gNPWOUffqiG0ooS8M303zeU5Y2
         yuKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlysbzp1H2c0OKzhPScWp414uNhzv/xJyBx9ArQEeADDCwOIOpw/Lq0FacIAn8CjHP792RO3wASwO5SltIVFXL@lists.infradead.org
X-Gm-Message-State: AOJu0YwctFEX3OWfHmAyut5B17R0NLPHgAN1Gj7GLLScXsRl5MsPM5EJ
	cghKj8+6kEQMLs24gW99tNTEyZupooELFZlbM8kGmDR09S0Ql7S3bYzQ02XJi+0Bx2IcrVzw15D
	Xq4xP8HS1KWrktyIgzSkQku+Ski8lyzoFJgo8PbckFeMn4c5UYh1G9y02k9dPcS1aRaXRuElLTR
	BY
X-Gm-Gg: ATEYQzwsoKAXwJ/FutsjABelvlwb/drdPiG3H0Kx65iIP+7pZGqdOO5/3sUJkgyJAD+
	QHqy/t+aYTGTbYQNDRVOtqJxzmdQYZLIjN6ZPM+HB/2NMSq6mw11Kfc17D3pBxOJ6f0zJlu5fss
	v3YtSQ3V9qHDLMUgU9p31JjByJygoiHmFhosjjfjWBEXdeiywnuC8WWYNStN7f+2lfEDcD/Mzhy
	ERdRTvwYF/15WS/ZtOP9/3vcqNVj/IipLPVkXSQq+g5KBKSzPdpwZB3qn+k2g5dxXHBLcjcuivG
	ZbydcVsDQ+33rzbSgMCTlraYOqcJRRXvg3Qr1lTDzi+WEJDPAfvoFdb0fodJrT5me++ShjJuJkU
	4CabV07FS4+C+NZYBo6/jjXYD8NZADYbmIykgSL7GLVta4cyMEvkfwLdyz9f3LE4Z
X-Received: by 2002:a17:90b:530f:b0:35b:9720:98d0 with SMTP id 98e67ed59e1d1-35bd2c20602mr10397212a91.5.1774248496671;
        Sun, 22 Mar 2026 23:48:16 -0700 (PDT)
X-Received: by 2002:a17:90b:530f:b0:35b:9720:98d0 with SMTP id 98e67ed59e1d1-35bd2c20602mr10397188a91.5.1774248496287;
        Sun, 22 Mar 2026 23:48:16 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd40e4bf2sm8105752a91.11.2026.03.22.23.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:48:15 -0700 (PDT)
Message-ID: <dd4990fa-a864-41f3-bf61-7696416b772b@redhat.com>
Date: Mon, 23 Mar 2026 16:47:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/40] arm_mpam: resctrl: Add resctrl_arch_get_config()
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-18-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-18-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oGI1RDsZpjYEpx3GmqQiXZ4LxQCNFpCHt_KQ17Qyee4_1774248497
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_234821_086932_AE4A5AEC 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

On 3/14/26 12:45 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Implement resctrl_arch_get_config() by testing the live configuration for a
> CPOR bitmap. For any other configuration type return the default.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_resctrl.c | 43 ++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


