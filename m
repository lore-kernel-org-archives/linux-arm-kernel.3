Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF4DFA1FDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 18:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=UgPO/NbskuOhdPOSGOgEbfwqbCTSS2Gc0tnUci+MT3Q=; b=kYpEoizYLo6QmCrV/eiaPcFCuA
	8WIEW9SR6Js2Blui1JT+ybkx96MT5nNPcEX2vnrmas6rSOfmjc58Usqc7yNCEOYJzmVF288hsqAs6
	5HayKKzxuIDieatzF+ky4D1VS8h7wL5E34HXA9gA2nIdb01SjDvl4zf3wu0QQF5sUMtEjoonkWK8p
	+oiti5P69hwhRNurDFOKiRz5IEUJ93xOdOWYlggQ42qqpNosiu0XUD4Np+pBssuAMbU+hgDBvVevG
	NYDcWauvzr+aWrhdkyn5cJ0RFqqpaII5rGD/FWD9/5OIofBVx4ydjLRD/QKbtNFFb2+syQE0u3APP
	n0thzqVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFc2j-0000000Abud-1LlG;
	Wed, 22 Apr 2026 18:11:21 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFc2d-0000000AbuI-0mHM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 18:11:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so73795005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 11:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776881473; x=1777486273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UgPO/NbskuOhdPOSGOgEbfwqbCTSS2Gc0tnUci+MT3Q=;
        b=lg+rYAWr8MFS4E1FMUkjzpCTvfBLDHZMoplBtOXho4KBqcF/0wKWkbbnFcwtBgQb2f
         ND2l8RiLO5Jr2TbCSFIWWiiUAOVMvtTTSLlR5cLpB9oBe+djWAfh6deJdoOjewCly4c6
         FS2EJ0P//9InDlGVkmHoGt1V0JfPMjpR62lG5gXIPI/3jbAVrmqpOrNk6/ZZ+iwnLoXh
         h5Ef9UjmBIzFG7GUnPXecxRH8aELXvDjTWjq20iRToyLSZsUSlVxvOUXst5JfwSqOxYW
         DRKINtgLqMwWW+GrvvWxch4cpiXdl8Eoj5mc22SVXd0QGFwNorpkiYKpXtIbql0bdWbX
         xLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776881473; x=1777486273;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgPO/NbskuOhdPOSGOgEbfwqbCTSS2Gc0tnUci+MT3Q=;
        b=ZjIU2ayv+mR6giEyBQ8++eV0Xv35v4QfCwtf1h0kIe2XOEWJXCzkMwVaQT6rIioBkD
         VOzYjTuENQ1vESseEsrJG+eE7H0mChGO7P26i3v5TYw4Q67WzEkIa36UOTMyU+s0tmCe
         j1jP6GNkZDQ+1SLP1/LXqQ8v4XHtUpBHfx/ElfoMFFjVcFQQlMwcyMucXhEoNFatXeIQ
         ceZHypftLpdDlJLZBB/HZLgJs5MtIcsexnzKdGpLEZVKRpxKpxzGhyFVNMLaQ1YhFgyL
         UABRPPIfMqtxHuO4XPjG/qpP5HQuXRXHJOXEscC0Hzg3s3dcQYdDcbla3v/hkiDHX1Vw
         PG4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Lpu8mbUAQZ7PIuQVsn/UALQtmzpSCCL3gyq2llDxi7dYzsqCVdKlSrDBhvJyprdnA2/Y7VPdLCAXiwL8TfyL5@lists.infradead.org
X-Gm-Message-State: AOJu0YySdzyvVtLJZlMJGUqlSF5p1NFLEnXskRxA9lNxCY5qVi0tRUPD
	MPsgp+9XdJp8ees6W/tZqtC3v9W9cI9HY33b0fXaJM5lbF9zcCGiVvgBSWyapnPl3A3fcg==
X-Gm-Gg: AeBDiesUc3ytKBii6k5ux83iXfOA62+kAGyWn5tivd8HBVwvXaNNmIQ5rJXTGZr+181
	OqAvEOxci0uwk9oAs0Kk3KPslHjJBP+dxShd2VHOMCCZsmO29okhXQP+L8jiySsDGp0Fl0CgPRT
	onBvqMY025sLfIS4VgXj5keqKXd/yN8kQ07IEpL1HQ1RTecstiBnw7ZzVf1bwtY7mDtNIIhNCug
	ozduz/0stZdhkJT8gCs7dTFqxNBCR8qBE9lL6yqlN8ZrUJT3PcCQOszMeSyepofY+SscN2WzLkR
	KEIavb2fzaoYxmyHRX5De5tuVerNnnluWIgs1umE2TNJxzKJicFq3JWStVRvemvVr3wDw7gYDBp
	N30eJ83N87AnSpM9haz/pjVaePIlpT5T9XwkFPDV0HP2ltVDBz3zePwRgznNOPdCSnyjZ9vLegI
	y+nQxixyaMfraK02bu9nCwBtH4nhzfnBXbsbXQ
X-Received: by 2002:a05:6000:24ca:b0:43e:a70d:7632 with SMTP id ffacd0b85a97d-43fe3e0b463mr37323014f8f.25.1776881472867;
        Wed, 22 Apr 2026 11:11:12 -0700 (PDT)
Received: from ehlo.thunderbird.net ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4ffa8sm48497290f8f.35.2026.04.22.11.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 11:11:12 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:11:12 +0100
From: Josh Law <joshlaw48@gmail.com>
To: ardb+git@google.com
CC: ardb@kernel.org, arnd@arndb.de, ebiggers@kernel.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-raid@vger.kernel.org, linux@armlinux.org.uk
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_3/8=5D_xor/arm64=3A_Use_shared_NEON?=
 =?US-ASCII?Q?_intrinsics_implementation_from_32-bit_ARM?=
In-Reply-To: <20260422171655.3437334-13-ardb+git@google.com>
Message-ID: <7DBC760F-0524-41D9-8A6E-6119F0E1AA9E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_111115_233394_5C160B0E 
X-CRM114-Status: UNSURE (   5.07  )
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

Hi ard.

>+#ifdef CONFIG_ARM64
>+extern typeof(__xor_neon_2) >__xor_eor3_2 >__alias(__xor_neon_2);
>+#endif

Creative. A  reduction of about 150 lines of duplicate code while
maintaining
the __alias for the 2 input case is great.


Reviewed-by: Josh Law <joshlaw48@gmail.com>

Thanks!

