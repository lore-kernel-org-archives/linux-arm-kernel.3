Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646AFE677EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 05:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yl0ZSjV2wwdG7v/jul86kkIeCsNbggoH1Vd4XqoR3yw=; b=In3koyW1PwS/Mu3QNPajrcpcue
	IS29vV5akd9ahaAPs8oPmN0VsQnugiesW11f+vFiERxEEIvf8saMpNsEqdFt0rmd661fSmer3cs+E
	F+CqgoGjgjudSoRKjEt38x55oD0SlPc6Od+zvwp0sfu2JMyN44qWeEVWh6s8u2L00lhJdj/L5pOLk
	M00XoTUR1lg5vPhO7C2CuwYcQ7p0mCtrAKbG4y1MNnt9baamZeO6hDnI99haOrERq4HcBqgWnay43
	s/Z1ylJxRKxtHEPXOW3i8KVJBGqsQYlmxogB/URCg0cnCOjl98UtlQSBx+bbH1yVtAzHCb5XWEqIQ
	V+4Q2pkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t76nf-000000095hj-2Unb;
	Sat, 02 Nov 2024 05:35:51 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t76lz-000000095Zu-2Rx4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 05:34:09 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21116b187c4so15481485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 22:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730525646; x=1731130446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yl0ZSjV2wwdG7v/jul86kkIeCsNbggoH1Vd4XqoR3yw=;
        b=fVEP8qPCESlLIdeMXK2l4DSye2Sk2wg+mWGJVx65qKk0lNwau7TZI0cL8QXrcdJevV
         40yTv0x5Ax3aCN7e3aE1F9xVGNPdHje3Z0sjXGvcaIhPgmhbZoqqKhKo954g7ZSlFAXW
         bRlqtwlLLMdSOlOdpUWzvDcc5w423r1tVcIjTX8f8LiThUewTxxgdavamNlgu4bQWcuC
         yWvQ2xvuTKnmAza2AA9FcRXTSOPxRZp1jYMmcRiR+zB+fkNp++rcMd+F3kWdKDLkCV6V
         z6oPnACChOhngbRbSy7v/FevS+I68T6SejTG/E6SG1d7UkzS7Xlv5dnMnBKyE+6Jj0Ht
         GiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730525646; x=1731130446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yl0ZSjV2wwdG7v/jul86kkIeCsNbggoH1Vd4XqoR3yw=;
        b=tNQPRlxx98grXjpfKEl3hYm2sAX6xF9l0ECpVRADsJ/+Be3D3cswr+2qSgUh7jepLE
         mNqIh13iQLDN35giKAyrrkq5Oi/M4FAE/FAkswEc7rsT7bFWfE8dzYlkvyLBU0fbfNHa
         DOYEhP92Lq/5YV5871CrwhhjS1s+hP2eAjLA3CO2I0iqHAiIWsvzhKcUXjoik3aOGFH6
         JOaFqs3kPdfbNgYZQ7BIo++rzBLGlJwfWJeaxC5fAGib2ZvOmIZ09zlZ5zQ1LU9kB7dR
         GbCpwj2gUu1G2/CkvnT+h4X+jvmbxTXbDt2o2xUbTPjjgTjTvDhCwBhzvjaI3gNFx80H
         w5lw==
X-Forwarded-Encrypted: i=1; AJvYcCWbgAPhXFYWF/LowVy0C0MKFCA10KCLEOE85/YI/ZGFCDzCC6+mGNdxLfuJNFIFfCLrqOF+EFqBtFNZT/WUy+A7@lists.infradead.org
X-Gm-Message-State: AOJu0YyQg9rYUNHqzmvLVt2R0OBR5zYiLAd6Gbp3zRJMG7kFYjkNrCH6
	v2Bgp09X1hJdiuWaT12qTkkhB4Mp0ZbmfNtWe02wBD3Xx8BauaEfoX7KcQ==
X-Google-Smtp-Source: AGHT+IFSBLSRmWr+ADqlQojeA6O0wCRf+1EVr8y7UIwQWNNJ4vrlbCerMlqoHCiFATN78RepdHZAyA==
X-Received: by 2002:a17:902:ce85:b0:20c:a1a3:5373 with SMTP id d9443c01a7336-2111b01c640mr83003945ad.55.1730525646080;
        Fri, 01 Nov 2024 22:34:06 -0700 (PDT)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a63f2sm28700365ad.168.2024.11.01.22.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 22:34:05 -0700 (PDT)
Date: Sat, 2 Nov 2024 13:33:54 +0800
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew
 Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>,
 andrew+netdev@lunn.ch, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com
Subject: Re: [PATCH net-next v8 0/8] net: stmmac: Refactor FPE as a separate
 module
Message-ID: <20241102133354.00002357@gmail.com>
In-Reply-To: <20241101142908.ohdxsokygout5mfs@skbuf>
References: <cover.1730449003.git.0x1207@gmail.com>
	<20241101142908.ohdxsokygout5mfs@skbuf>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_223408_168248_46277873 
X-CRM114-Status: GOOD (  10.10  )
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

Hi Vladimir,

On Fri, 1 Nov 2024 16:29:08 +0200, Vladimir Oltean <olteanv@gmail.com> wrote:

> For the series:
> 
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Much appreciated for your valuable comments on this series and also the
previous series that moves stmmac FPE over to the new standard
ethtool-mm/tc-mqprio/tc-taprio.
The FPE support on stmmac would never be so complete and so soon without your help.

Have a nice weekend :)

