Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE97DC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnnA+hu4V8aSPXEUCWQPC65BdY+sjOrXVnMp6lLQJmQ=; b=3oK2ihh/jKlxeceP3yCY7ElVS4
	9ExPcfGqekZstFL0UjEkYa1OzigL0L33G47aNSOkHg7ZSUVUr/VCzxW/t9ir3QayEGPBpvtlL8QUa
	4iB7KkT8cC+zbhThYF/Qeu9zjqYZ0vHMlU+NHMTJmsV2vCqCJi7liQToH9duc4mLgj0OU7mRCttVh
	dN3wQrSs2gZfEKAH6WxuimiEFRu0wSQrEDDcna9CWZJmPn8wYNiZJMlYDsW4qCIEPvxdu3w3sq6Fp
	jrrleVgCiDfxHpcHZRlGgCat0LcGU3D9L5jZGbr2g3HF4jtObnbu9RsbvkyotwzzPDmiW6pPfL3U4
	UCp6bNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tJL-00000004HPj-1K57;
	Tue, 22 Sep 2026 05:44:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tJI-00000004HOV-0qIv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 05:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rnnA+hu4V8aSPXEUCWQPC65BdY+sjOrXVnMp6lLQJmQ=;
	b=DjE8kP38Fe+k6/J0QnW8J16ZylkX4aCOyZIOkgP5DezM8EBEdiRS0epUGzE+mSxBzYp3AJ
	9vrnf75Cc+wAxPnSstMT6VYt6GX5DfSt9d1lyiFotbZGQmrMwK9YK0EcTX5YC/fVC6QK93
	pF46cm5fUwZ9nz0QISlkWfFFjCh8aLE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-sMwqy0r7NzOCmBRa-z6Lfw-1; Tue, 22 Sep 2026 01:44:53 -0400
X-MC-Unique: sMwqy0r7NzOCmBRa-z6Lfw-1
X-Mimecast-MFC-AGG-ID: sMwqy0r7NzOCmBRa-z6Lfw_1790055892
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dd753a52bbso69000645ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055892; x=1790660692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnnA+hu4V8aSPXEUCWQPC65BdY+sjOrXVnMp6lLQJmQ=;
        b=BtFrMIl79dTtSXefvw8Z9omsmydeP8rIShbiK9lcUSxhSRTx/TMQTifboNi9aQs2zm
         UDB8digE4fj/dSFa3+rF6/5lmO7Obgw5m5to3f+YE+hdG/3si7xCZpS0PigkFji2yO6P
         BKoXZBhX3BBQ2AdTxRJMVGdu2xoFLWjSMHGkqeOxCYi2nZMuGR9dgMRc0AimhKf3w1zr
         atf3DYBKKWwfHZYaNkBPkjZuP/YZQow8OG5Rmru6Zsfev8mImOGtQ2q9oMkpp9HqcLzN
         V7lt4d9X+8yEuk4YMP0CrJf97TRcxEbNwdR5ybbGb3S2mv5cpYSdaqzhDTRid4Zd7PTw
         EWew==
X-Forwarded-Encrypted: i=1; AKwUvBzDYSHAdBq3izhYxPiGw+WoNHICxZBRLhB22t+92Z09GTmBiLWakIgFvvq+mKuLwFL9XhCPoUy28oUtNGIU6NsN@lists.infradead.org
X-Gm-Message-State: AFuF++l2y60l7RTRpFSRAP718tLtnJrS5dI9Xqv/zvQ1VMfe1/fr6ddb
	9iWKwP/hvDlzTcoHjrk4p8OhnmXIFUFonLF55J97DhNp667EQ+VSSWzyAoWJbvgPT6/W628/9h7
	SvlhqvK6oGW2FSZ7rMYCFJqxER1Gkwp85/D+fiF7oeg/CF93haC9FMGkJQ1+qUkw+NpDffTHTpm
	wQ
X-Gm-Gg: AYBFou2ZptE0OFhipk1ZHCExnNrlztc+kY2/6KtCN24bWPwxjp4ztE6cRH8n9xGlXgK
	MCw6OcDETSWsalxJD3X1C3ViFvMKtp07j4U/53mDz0NWg7hZeniW7OT+T/v65Az9Dso8MuaK49z
	hcdhdO70HAOBzaInewY5VM9YnkKiWHIBqdvqbCTslb+yWVS0UW/mQPvAPFr7216g+h8msj1m9VU
	mFrzav80nzZFFHX4hRW3NxkBa3V5Ss2h71jwbhtKjx08MKe1bHyorhaS77xati9r6wcymaOEX3Z
	iSVqp0N7SfdK8jqU+WjbCYp9V8nidUzGVeh8CklOqDvaoWYWoiyHGr1+5jIke8N+eAhmf2bMejk
	KNrSiCGqAkjjN3ijR3k0Vt/Z75Jkgr95aD7zO0JQhYg==
X-Received: by 2002:a17:902:c94b:b0:2dd:ad73:c939 with SMTP id d9443c01a7336-2df609d71cfmr1169365ad.26.1790055892347;
        Mon, 21 Sep 2026 22:44:52 -0700 (PDT)
X-Received: by 2002:a17:902:c94b:b0:2dd:ad73:c939 with SMTP id d9443c01a7336-2df609d71cfmr1169035ad.26.1790055891896;
        Mon, 21 Sep 2026 22:44:51 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d01965esm3653455ad.23.2026.09.21.22.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:44:51 -0700 (PDT)
Message-ID: <89cf5ea2-d0bb-4cb8-a32b-ca843658e894@redhat.com>
Date: Tue, 22 Sep 2026 15:44:47 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] arm_mpam: Don't loop forever if there is the
 maximum possible amount of PARTIDs
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-11-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-11-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GG6z_nIgWMgYbsLqddVPUkU5t14jIR6DINjKF0o671g_1790055892
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_224456_332946_830AD390 
X-CRM114-Status: GOOD (  12.63  )
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

On 9/18/26 12:56 AM, Ben Horgan wrote:
> On a theoretical platform with the maximum possible number of usable
> PARTIDs, 0XFFFF, the loops iterating over PARTID in mpam_reset_ris() and
> mpam_reprogram_ris() will never reach their termination condition leading
> to a system hang when register the cpu hotplug handlers when MPAM is
> enabling.
> 
> Fix these loops.
> 
> Fixes: f188a36ca241 ("arm_mpam: Reset MSC controls from cpuhp callbacks")
> Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> ---
>   drivers/resctrl/mpam_devices.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


