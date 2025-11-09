Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551A7CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n99PJkbrVztG5y0o6lXl7OvJ8hPSY/Pukv4ngg5F/xE=; b=i68oA4jcmnr9VHI0I5stG9KmaA
	++5IO+x0Z7FtFHP7w6EIb1DOXFGo6x2/nAGmhC9xZuwHpsTyBU/Wn+xOrmCbzXLoB79Jj4f98ASM5
	RJPKxyq764pbEcd8n9TeM66PKdMssTpDgnN41gnfgcN02QvVQxXyDDwO3sQ8hpP3UzHZON7OyYL0Z
	f92w4EnyEXzYFSlJX4wil51VG8LcWxEmx2hwoCpd9OTyiL/FrpwAP9C4fPJYkbQb1uhOKT/GixEpK
	ywd+1bG9+5b0e2H6VR7onGeJOxrHTzuiptW2eqnaVWPBz/FPtfIavWiXLyD81cjO8VQaHMmhBfM/Y
	FcEwz8+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEg7-00000004UFM-1USt;
	Sun, 09 Nov 2025 23:18:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEg4-00000004UEY-1zaG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:18:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762730311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n99PJkbrVztG5y0o6lXl7OvJ8hPSY/Pukv4ngg5F/xE=;
	b=iaoKgs/rG2d58ndI1ZrSVgPEUZc+6dF4PiRDKIzhwbn+yR2gUxmpqBoxHHoeC0ehIB+3WH
	dU71I5BTOyKhKA2x6QCsw1CzhKVIQC8UtA679G5+ZLbb7qZW+d6pGGi6qYJai2gD8aFxA9
	IKczxz8XWCzmgXxtaMBRVq0RtOX0Buk=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-R7Lb82Q4PXib2MMP8vVIOQ-1; Sun, 09 Nov 2025 18:18:29 -0500
X-MC-Unique: R7Lb82Q4PXib2MMP8vVIOQ-1
X-Mimecast-MFC-AGG-ID: R7Lb82Q4PXib2MMP8vVIOQ_1762730309
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b0e73b0eadso5600279b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 15:18:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762730309; x=1763335109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n99PJkbrVztG5y0o6lXl7OvJ8hPSY/Pukv4ngg5F/xE=;
        b=RmLegVG1FOVdNUHjlP/96NPslcc91xLSzorapU0EbTKY8+rM9t4paiTMfMNx5G/vLP
         5od5fRd6wDr0EFYF721XqFH3gjFzTBx6BkMBo0lUxFZArVbMDZxG1JCMqj9MeaTjDOga
         96ZBCrb4PpN40qqp1mQDZbVVZ/bGJ2aFCEDL9VNsjL+PiK5sQ3uW3tuQMezI1BzTsti8
         luiuO8VaL5sepGZWL5aEbBYHsNjWTJcaWtL6Zju4ybrNDLlDh4OVtJCaq9zhUI9GOAMg
         EN8c4ehtwle3UwWMD5OAoMEoqi1hh/nBTYodK8pVojXC9LWljwcrOr5L/myZthXdY8VZ
         oCvg==
X-Forwarded-Encrypted: i=1; AJvYcCUnYJF7AX94zkQzpR7rpchqK7qSSxDMgd6yobmCyigtOPCizIuNmxv9F58ydaHowFo+pcaagO2yVndCwjX/oGrM@lists.infradead.org
X-Gm-Message-State: AOJu0YzcTcnUV/HxfvplBVU3Way9QM+OOWiDtguuN/RwjVzUu3b9jZq7
	juwtw8T93f7LVnLtA5tksoMagvS3mOJ4iQZdMCgSLjWjvIu9IPzOtebhT5bFSiV55QjSdHC1vOI
	ymoCLjkdTgu5hJYtCkAwodteSnAOni4wiVbzgvzs/26sHxMoFxq1Dy91oqfFKeaeIPI3QjjH2oj
	C2
X-Gm-Gg: ASbGncv+bU3nmrfP98m7JjNHAfZLvbvd3odbojzwsp1aj92R122DaVv8UqlijVS6Goh
	jIxxeX02tZYs2irHDMsrY3SQnhRNDgDo3xVFwTmpOuZMDB+dWL8cTVI0HDriOHDAyBDkWpKjrZX
	/y4dHcVgHk36hR1HWIbefuIheX2e8ld58StPK4WGPMT1V3diiR35ZrgWNlYt2qNUv9CJmZV+Qrb
	BDECFuMf8fLf0gcjQS8udVX33OijwCk1mgdTGgBtdJik6cLmJiKVNfLS4nsIbpMqww+pXb2BXTA
	5CoFDD8lgKjeIZmuqC7h0eoB+fXOOgSSd2BDciWdsjGESawZeRjfpxYq5UZqd3qWNPTbnYEHyGM
	3K0nBo84srS4ptVzMKxb/E3NWTeYENhins/CSSAg=
X-Received: by 2002:a05:6a00:3e1b:b0:7a2:6485:f336 with SMTP id d2e1a72fcca58-7b226696673mr7522431b3a.16.1762730308739;
        Sun, 09 Nov 2025 15:18:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2mSuUUE/RVfgQqmRz/YBiUVDNGBy59LbywexIFQuJ2RZ6fbmp3YuWDNYpjDv3UjdhEXNI9Q==
X-Received: by 2002:a05:6a00:3e1b:b0:7a2:6485:f336 with SMTP id d2e1a72fcca58-7b226696673mr7522389b3a.16.1762730308356;
        Sun, 09 Nov 2025 15:18:28 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c08ee9sm9664548b3a.21.2025.11.09.15.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 15:18:27 -0800 (PST)
Message-ID: <67a36e6d-daab-479f-a1c5-3b2444a71d7c@redhat.com>
Date: Mon, 10 Nov 2025 09:18:14 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/33] arm_mpam: Add helper to reset saved mbwu state
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Fenghua Yu <fenghuay@nvdia.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-32-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-32-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iBx-a6MKpLgeKlYXnJEKvFUy_jPfyotl6kGWdterFKU_1762730309
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_151832_590090_7D9A2377 
X-CRM114-Status: GOOD (  13.66  )
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

On 11/7/25 10:34 PM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> resctrl expects to reset the bandwidth counters when the filesystem
> is mounted.
> 
> To allow this, add a helper that clears the saved mbwu state. Instead
> of cross calling to each CPU that can access the component MSC to
> write to the counter, set a flag that causes it to be zero'd on the
> the next read. This is easily done by forcing a configuration update.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvdia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Cc: Peter Newman <peternewman@google.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> Correct type checking, use mpam_feat_msmon_mbwu_<n>counter
> ---
>   drivers/resctrl/mpam_devices.c  | 48 ++++++++++++++++++++++++++++++++-
>   drivers/resctrl/mpam_internal.h |  2 ++
>   2 files changed, 49 insertions(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


