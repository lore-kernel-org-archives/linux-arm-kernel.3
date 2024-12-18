Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D6FE77184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 02:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mi6OX5/5XV7YpUmNND/cHCqDPIuMkirhCKEh+GcVF1I=; b=ZRC+ljlR4km+Pytr96dylliIgD
	+lWicmp317h2aA/6aBRSxLUqd1z/MNOrf77YxFs9RiPMU8pxDUsYt/T7CFbQW8upFJUmETfD3d2Sl
	ylS94fWsyJBCUP1smG2SM2ODHRq8IFpVtfCzbONagLj5yGjf3AmK0b8YwfPWYb6GLXuSXfC+Pxd6S
	UvWLWnRqx7qBdUC7z0pqmhJ2Utkaz0b4QIZbpp7CcSjlOYDOcAHKmexbCOTlWsUu5M76fCp1iXGu6
	ORPMpscpcI7pTIq2M8dq+IqeTx2zN73MzKtGr1iDWSIKou8hE63TmPQXjKD5HrVJqqQ3l9xXuSAYq
	bcv/kNrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNjsQ-0000000FPDg-0NwP;
	Wed, 18 Dec 2024 02:33:30 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNjrJ-0000000FP4R-3bSN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 02:32:22 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-725dc290c00so238427b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 18:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734489141; x=1735093941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mi6OX5/5XV7YpUmNND/cHCqDPIuMkirhCKEh+GcVF1I=;
        b=aX13zBc153MIiYkQEn9ItcqVHcvM1yuW8bUydvBbvYkysCERRUhgYSgusixqJsZJxW
         l+Tr00rW2J9NTHl4PglppL//UEG1Dv7RzsWDES6/lK6F5JQ/niyyGhu8rB15bF312dsH
         egp+FcPr80T8+VErQJrQNDqwXtX3F9Zf0QMBHoQPAdfW+H0U7LMZ4zUzXvEA+s9Nn2LK
         JIleNa0sFx2PczuAI8Sbb7zYgy3/5Xr/Rc7AdBk16eKhCjfad/ZwC02LKuC5KF3Yg7T0
         aAyv1ckPT04dhTl3I1NxjomgfRGHmXybQb6lFR0/iih2Qi0ZG+ra0yzxUWcA+KVlNXBo
         OA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734489141; x=1735093941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mi6OX5/5XV7YpUmNND/cHCqDPIuMkirhCKEh+GcVF1I=;
        b=S3nWrKKy6JmBtE7Cp/pmTKtSxyRYy9aCKy0kBtwxnGUjiDn5oSQ4ki4qTCrkSgAOIe
         xSdqsDoJnJL/hx3jHp350QytEXGMZEpc7cxoTxfIfOggoibcwwHOyDgfE2SrHl/sbs0X
         rGLfHL0nrLwc7mqGBWRwrsfQXScnORUcgiNN6Q0maMo5gmyErWB98LqJa26WVsKIVqA/
         y+8uSX9Cz2WqaxsNAysCl+qFiTQNM9ahFFqmFgxrnMMkVvrGApfTiwAvyfy9kHu3vfCf
         JexhE+WfzIh/CoeW1TCyCjW7PZyk151P9vN2wx0u0zR1eSZjl4GvXCOczKppcVePPpCx
         JPqA==
X-Forwarded-Encrypted: i=1; AJvYcCVZriXXYv4JAGh6G94peH6R6hW3UJuxC5CPo0lzw5NJwC5otI2bhLuv916PvciJxoKohBRudZ78nG8nZ8foeTpU@lists.infradead.org
X-Gm-Message-State: AOJu0YxKhpxAGzqL3U17PujEiidTpv1FagH+6XWqhhoawUui2QABUhMu
	EnYQBXxQkAIBZx2SyL5/fsrCbbhU+CeRR4w/vDkz5KRE12CBeAvQ
X-Gm-Gg: ASbGncuaMhzH6DWvAYTpRz4osgVTJGlpUTedY3W5FnrurbJqRo389HFiROe+H3iB6NA
	5e8viPiBp7p4Qe6WRx55q9McHj3xUCYDwyyscoRw5soKEvj6/DB1x2jnwdq2TIlzl9qRfZGrj+G
	SbRKz/mgnSqqCEj5/MB4SAnGPVPOVsmQzCEKsBJ5QrtO2tkCNAFGqltJle6Y+fYottzFLMGPmSK
	vVdUl0/j5+qzKVvCO4Owds3EUHMGA/qVD1P89HROyJC3ymZC1BUGQ==
X-Google-Smtp-Source: AGHT+IGOi/F5l1GM4Se3SaVQy/qnJilh4hLpQ88FZFsSLJ+TwRZhiHnC+Sn+xH74+w/kACljDGykiA==
X-Received: by 2002:a05:6a20:3948:b0:1e1:b1b4:59b0 with SMTP id adf61e73a8af0-1e4e7993bb5mr7315774637.18.1734489140791;
        Tue, 17 Dec 2024 18:32:20 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5c38011sm6345778a12.74.2024.12.17.18.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 18:32:20 -0800 (PST)
Date: Wed, 18 Dec 2024 10:32:10 +0800
From: Furong Xu <0x1207@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net v1] net: stmmac: Drop useless code related to
 ethtool rx-copybreak
Message-ID: <20241218103210.00000dc4@gmail.com>
In-Reply-To: <20241217163538.GU780307@kernel.org>
References: <20241217091712.383911-1-0x1207@gmail.com>
	<20241217163538.GU780307@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_183221_899482_1BC2EC40 
X-CRM114-Status: UNSURE (   8.94  )
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

On Tue, 17 Dec 2024 16:35:38 +0000, Simon Horman <horms@kernel.org> wrote:

> Based on your description this feels more like an enhancement
> for net-next, without a Fixes tag, than a fix for net.

Thanks, I will send to net-next.

pw-bot: changes-requested

