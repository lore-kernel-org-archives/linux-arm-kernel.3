Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7686CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfmtM7RZ7AOffVFIOIyywezf5nzzWk/ab7a+2RFSGKs=; b=wPJbIrs9BRnOXA9g9n7m3AWMAS
	+64ZTICZLjx9BG1BeoDhVHJOndFRlZBs9kEOw9fQdQMxzOHdEbFYfFH2lUp6VWJoHM2A7lxS3ObLy
	3YxzYMxOm29pp3iwC8oZ8mDAJLKO451EGZwHCZRlA7GYLSsEAm2q3Gl3fx/lHBuZS6yWj+amcrzwL
	pkLAvuy0VAbAa8+JSC/qG96oDC86u3U6//GkTWV8PyjC+VLnXNHuD6HkrdpXJp0e506Lwi+Rd4v3T
	rolR4Rr45JDccX78gYgFTWSPD395WYpJXCvC3gWyDyQ0NWxHcA0CUImqE60GbLaSMIAssN8KoJ7Wu
	AttQceUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28S4-00000001YKX-0wTb;
	Fri, 26 Sep 2025 13:25:32 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28S1-00000001YIt-3ofL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 13:25:30 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-4256f499013so10747065ab.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 06:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758893129; x=1759497929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfmtM7RZ7AOffVFIOIyywezf5nzzWk/ab7a+2RFSGKs=;
        b=Jaz379SqSNszagYylTmua44ZMgm7vv78ymeT3fGTJpJRJJ1/9ugfgrFRSrEnQeoc9V
         6J7Uswm1PazfD1AUlURWroWnDX4c1/Eu0UVIh+v0G0jdljAFtJmpUHIAgXPNc91RAr9Y
         Szn3Bw1CvL/LynshPlYNLcBm2dW2+e6k1MWAWRb7I8aecLKL+BcAiD1ocDVIANeoNnDp
         58yniFJVMF+iuodDjXiqIDu4ijE83RnHU+JTNvYfn08JYKHuI73FHLbYu4TDcInTQkwr
         MM+uGwYlVib1z3fS7F+TBeAtVjb4325j6/4ACYZa/aHGuDta4GHdsQr4gYJDTyCDgat2
         f58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758893129; x=1759497929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfmtM7RZ7AOffVFIOIyywezf5nzzWk/ab7a+2RFSGKs=;
        b=azKw7h8e5PAvtBNs1c7iu7j8jEffeYKLI0PVbB6AyIqBlp/9GNwj8JE5zOyjkdDjNL
         qws9d2PhiRhpIaOQXss4dC0N3+RuJxGEV7UQHVPDfqmPQklNJXsl0thMltjDIpXnbsj5
         AYkILabjJXBWTLZZ+dlE3mWmD4Wz5LBeB43vi5Tfk3ByiHEGt5UNlBARPxtVIhLdPM41
         HK5Y3vtffsnM+TGGeS/QV3BDDSkVnLLxIJCYFRNlAXct6A/QVDu+ySO/EqWtgmzPe3I4
         4bpwIxATw09wa+KDsYJugbdXjQcCLGeawkFBOgMtK/B5mZG0qdTNd94DmGSV4gkxXlB/
         XtMw==
X-Forwarded-Encrypted: i=1; AJvYcCUweFX+sJ/MYHMesnTaNcLF0CK7PLM64GALBNm+d8tyOKTh9hQlcemilUfU3wzhZMbI9ozSS6RufSBEGkqCtovc@lists.infradead.org
X-Gm-Message-State: AOJu0YzMunFx6ifEiTOcM4ft3V507iGZKXiFZZ3Coa6V4qCI+GqPdBnx
	Jim+9gomHHUQhXDMHGO6MrzdDCkOkhw8Q+fUIV9sxlTsjHFEVXEMh3Xp
X-Gm-Gg: ASbGncsvYELqSXYOrlbuL2zXm6facZoI9bqKXwV6CI4Y49PPOdP9pO15ev7zQpsMqop
	DpZN7XLwp4cUZim46X6DaSWYps75GBmSFiF60li/SkKKoPPNOsVBYOOuWIU3kw/munYLt/u3uKK
	WfQG/Q/PGNPvVRRa7pOuX0wFEhQ7zEylYrl/HhD8OOSwZEgZx+lZ/EeTVGiIzAelxSXY/KQVvQ1
	JSQ3JJ/C4n6vFz3cknQXnP2u4BnEx0A0qLFhwYjKgO1X4r+0eVuq+wOsA79cCVOMytypgya3TB+
	bP0chovbol74e5K3cP+k+Cxhu0pgrAUoXW+KBSsolmHzw7Gpl4IZ3x9UZEhneCexRf+H7rzujsK
	Aq9wub3XJgTWEfyOKZtgFHB4uPx0gszz0
X-Google-Smtp-Source: AGHT+IHuN12QnqYCBArnyQoijmnt/uUh4vZpuhcsJapYpJzRJKR3sYrz93g3wBFXERLf6b51Mb32mw==
X-Received: by 2002:a05:6e02:1aae:b0:424:7ef5:aeb with SMTP id e9e14a558f8ab-4259563befbmr99572855ab.17.1758893128569;
        Fri, 26 Sep 2025 06:25:28 -0700 (PDT)
Received: from orangepi5-plus ([144.24.43.60])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bcb5f6e9sm21946655ab.19.2025.09.26.06.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:25:28 -0700 (PDT)
Date: Fri, 26 Sep 2025 21:25:16 +0800
From: Furong Xu <0x1207@gmail.com>
To: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew
 Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next v3 1/2] net: stmmac: est: Drop frames causing
 HLBS error
Message-ID: <20250926212516.68d35461@orangepi5-plus>
In-Reply-To: <20250925-hlbs_2-v3-1-3b39472776c2@altera.com>
References: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
	<20250925-hlbs_2-v3-1-3b39472776c2@altera.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_062529_953622_BE1F2B92 
X-CRM114-Status: UNSURE (   8.52  )
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

On Thu, 25 Sep 2025 22:06:13 +0800
Rohan G Thomas <rohan.g.thomas@altera.com> wrote:

> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> Drop those frames causing Head-of-Line Blocking due to Scheduling
> (HLBS) error to avoid HLBS interrupt flooding and netdev watchdog
> timeouts due to blocked packets. Tx queues can be configured to drop
> those blocked packets by setting Drop Frames causing Scheduling Error
> (DFBS) bit of EST_CONTROL register.
> 
> Also, add per queue HLBS drop count.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

Reviewed-by: Furong Xu <0x1207@gmail.com>

