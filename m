Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F73C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 17:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBbzW+U1XX2evPmEKqq7snt9OxQ5avJUWLwD2vkYuH0=; b=AAl06MUzdvoEyL8fz3fuMvwYMM
	/vbtZxok5jKUzbNq5Gg0IsqUXvnKQ5MpmFsg/gkXw2NmSrfJ4ikjch4INxj4g1UqsTWC1JXxQ23v0
	cXlean35WDw/K7oCDO2V4kOoDtsyjfAUzmOpSnU70s9C+LOQ6cDxrJwcxw58p87vUGRqb0R0e31dI
	1aRa+yP+nUZYaxZS5c0JcVc6r+C+QRN3qtL1nnbdcCvmL3Ol5d/Nr3WJpjMCZUleizVokbhgm4Kh7
	yxLHLg/W+7AzgM8m47ZfieU7L+MnTi7/n8OHeQTfrLcpNPiQRGblfQheTyBNT1BjEveBpIM0f+BrH
	EPCRlmuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0NF1-00000007BxM-2Ril;
	Sat, 29 Aug 2026 17:53:19 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0NEz-00000007Bx2-0CM2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 17:53:18 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2d71ae3455aso31787325ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 10:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivian.com; s=google; t=1788025996; x=1788630796; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBbzW+U1XX2evPmEKqq7snt9OxQ5avJUWLwD2vkYuH0=;
        b=eO84HbmpsQbFR9LOsT7P2VHGy8sojt/g30DB5kX57dPoOS2r1SOfw0O1Wq1mVkYv/f
         yC6MK7xuIRyEWRB8iUZ59U3Eo91yBXQ4q+4WLTdQpU5REBTQGsa/XkzQdQWCQToC9t+F
         JYNcJ2qZQdW3ZMWecQVRLevtGeU7hw5tkI5QUoB68MmpoA7lMQnj8QPJ0eLmMctrXjUw
         goQJw/EURQWB9yN5X9+qNtVa0CVQCuyHHZ7Ca8UdwgSqUjsRHGhYeiyGxYY68E+2pmwh
         YpmJtk7p1tyGxX2Sfhtda7exN2iBbNdpLm5urB/3JDx0SCSCaaTfTLtYQT8p2jyyBf3V
         Yu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788025996; x=1788630796;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBbzW+U1XX2evPmEKqq7snt9OxQ5avJUWLwD2vkYuH0=;
        b=lc/PVWYgmmZiXxfH54PqRwiQsgva+cdwi97PsouWDaVzC412KEb2zJNTmUNAYoNxuD
         YBlZY39gVXSWHJdCRiFRlu1hQm2X6JHt1/I29hl5yUt0mZTnM9/C2n93anHcjZ6m+/3m
         WFH4D0V/p0vRtPKbo6BL0zWzw+bxa8jAPemOXN70h4i7X/Ba+Efs0w7p9xHYMR2UruXF
         Rt/OxpIU6SuBezs+FTp9sBrdGdj3fubtBKlCUf2HIVU2xDlX3+skq4W4/oZQ5iiQtGab
         hcWctwp/RI6BizxfrZNd9N+Ax6o4an4EcYB6YHIoAtJrdnMKBvyjtWoezYoTcryidIIJ
         oS+w==
X-Forwarded-Encrypted: i=1; AKwUvBybj24oFxgvLoIB+vrv77p2UkoBCYKDh75BxPpufkNI+T7gHg16cm4XCGVv0llhwZ8aJuWMPX0QjCvDQTSewQYm@lists.infradead.org
X-Gm-Message-State: AFuF++ngYUali1kjBds9QPF13GmnxXl4uOrDyNoSz3UtPeri9aR0RvEZ
	YifQrF4l6GI7h/DwB8UtyAKdDfYWmBXcLwNOE+nS0JCGlXpQZQtQLfJcN/VSu0SnzVAIL/hx9lj
	6ODb7wrFPBak0tgx9zpwJfYeUfQLl75hSPhPjhGzamaag4sf1co3ZO+lQk9JYhGD8/cz59g==
X-Gm-Gg: AYBFou2PN53rQmnrjzFPxMLT9gdjQvx2gryhSx+KdJ02OFUqjE9yfXK2OzSAl2eryBv
	/UTBqyX5ZCBZCebn2k+NHVl0BuK4aC9J5sFELwCFMS6io4PU5VRL9R/TEeO3KiSDNB/GetsWUWl
	8to0OznZ9syPOcGQ2vy6gC+oaxuJd472MceSddBBlPs+oIkF444KRr0J7AIJ0aWvRmL0M4YgbEU
	0U7gNESZcL2+G+2Mv0uqT6CTTKyp6hMQyOZ+7Taq49zU/onr8bShDuK4ryOH7xmVgwouaxNeWeo
	ggt4BraTDEgspGOqBzNBLKHoB4dlS2nLYGn9GMjXWpoJTy3DH00x7N8BVM4iE2PTTwL9bgfzRtI
	Uku6EWCGmeMRwAIeLZ/7V8gkA8s9+fcy5tZG+mjWLUiRJlE26+fV4vWQkZwkt0R3NeCDmaBvFgk
	Pys0duX07rabORZU1UP9QgP3sG33+jTU3TnAAvaxhw0HZUjI+2p2Ft0G6m9CTPOX8yytCstJke2
	yRStdjABqCfq59HRAVMbTTCBNL/KvWWFznQT7dZFMT8mUMxTqrjj9Yf9pa2mwEKkmzNDppkrhuN
	t/nspa/Q3lIqXL6Q
X-Received: by 2002:a17:902:d588:b0:2d7:1e07:4859 with SMTP id d9443c01a7336-2d74dbe40e6mr273366975ad.2.1788025995458;
        Sat, 29 Aug 2026 10:53:15 -0700 (PDT)
Received: from ip-10-198-159-19.us-west-2.compute.internal (ec2-44-232-128-107.us-west-2.compute.amazonaws.com. [44.232.128.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8fdf63db8sm2159795ad.27.2026.08.29.10.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:53:15 -0700 (PDT)
From: Roland Dreier <rolanddreier@rivian.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Couple of SCMI race fixes
Date: Sat, 29 Aug 2026 17:53:14 +0000
Message-ID: <20260829175314.4067393-1-rolanddreier@rivian.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>
References: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_105317_102192_FA48B15F 
X-CRM114-Status: UNSURE (   9.37  )
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

> Noticed a couple of races in SCMI code around delayed responses that
> time out. These are probably nearly impossible to hit in practice but
> the fixes are pretty straightforward and it seems worth having the
> code be sound.

Hi, just wondering if you had a chance to look at these patches, let me
know if there are any questions or fixes needed.

Thanks!
  Roland

                        |||
Ignore any footer below vvv

-- 
*CONFIDENTIALITY NOTE:* This electronic message (including any attachments) 
may contain information that is privileged, confidential, and proprietary. 
If you are not the intended recipient, you are hereby notified that any 
disclosure, copying, distribution, or use of the information contained 
herein (including any reliance thereon) is strictly prohibited. If you 
received this electronic message in error, please immediately reply to the 
sender that you have received this communication and destroy the material 
in its entirety, whether in electronic or hard copy format. Although Rivian 
has taken reasonable precautions to ensure no viruses are present in this 
email, Rivian accepts no responsibility for any loss or damage arising from 
the use of this email or attachments.

