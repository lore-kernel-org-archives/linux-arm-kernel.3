Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650D7D767F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 17:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVTW9hw36AFB4MImdvCga8qTTKZp0wzSmGjii8X9VoA=; b=N7xOyl1dpDfDQhsAVuJttp9KVY
	jX5ZRoqWTYS8q5qGN3Kk0sEq3sTH7lePog9PGJx2jB62huTuYPRqNGx7OGed2YhM4aTq+bpNL6KxI
	rEYnkpppq9js4saZc46PCi0tBC7CJ2LN2dqKgWR0reDit2knHfTBGI4q3RGfCdEG1ImZs1aRrpIhd
	eI4Cy10Qc8Kzbg9jYO0qZfm5xOp/147dNZG0X7m6MnbGYN0ao3jyhyMibGzJJrtXFH7hT09DHVtX7
	kWLYSfGnSr3Zq49QEJtamk9Xd5RJ/YWfhDBEMdU0vwRXgjxtCq1Tlg+aqLp62W9ObgJMU9KRfsGKu
	siOMFiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Yv2-00000004Kzq-0lKO;
	Thu, 31 Oct 2024 17:25:12 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YtJ-00000004Kmy-1L3R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 17:23:26 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d432f9f5aso65214f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 10:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730395402; x=1731000202; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VVTW9hw36AFB4MImdvCga8qTTKZp0wzSmGjii8X9VoA=;
        b=DE0qweKlrn0NvNBw5jwH3sclg422HqrTYzf9UwmrRY1XOgPIJByoelfRUUMaH/UNBR
         764L8PPnvRZtFaqWTUBZZPIydS778Zou/xccJdG2chLaP3iKb40baSiArxzrrwlOebxt
         LE/l1B+3CMP7yKhpKNIkbQ8e6llELGwIR7dYL36fyTH7AvWR79V+tOy/FzqSdOA/SPIx
         j0hfVJUfYnTgJLj0EAT0EnQv2YibqePBLwcdCJmaBPuugmE/bA1T8nyKWS7MrcP055v0
         YijccQ+a4ZUVmTorpY2AC44giG+HNcplSBEOvXb8OtcpuV0N3s4dgaOg0nPZsDGpCNpG
         OoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730395402; x=1731000202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVTW9hw36AFB4MImdvCga8qTTKZp0wzSmGjii8X9VoA=;
        b=tvPJgvqSuHStN/gNH3n68ZbNhHJ8liSG/YA8XX+akCISMoWUEfcfgo4zjDV+dpFf79
         1NFg74yjcxaQaJ4HlJaSb6nHQCwOFF3B9B3eqkeal1f7ULCpRoBGhbr8hr7k1+iRE9oS
         H9uMzgOIcB+D6Aswvzg2yawgtYQyI3bY3F7AGNqwNOmwKHZ74TjsxVTAL4E+ESe7NnvR
         occ7QnRIki7m295Q6Dxi85rg4q5jWRJhJhI+2CPWCk0tsZL2etj3yUwuO3x/5maTPbs6
         HOC/9TtV6ca3uLx7BwxY3wCvkg+QqRfhfndq83WKKyeSg2A8830g8reRsIt+kkrDfjDz
         VTcg==
X-Forwarded-Encrypted: i=1; AJvYcCUCgCKBkE45KdPiPN3cdaWq+rxDW0e5T1MUHkC6unuHbYNgd/fv7K2RtkDTqyCsZo8q4L2znSMQpvhLjFNinUZC@lists.infradead.org
X-Gm-Message-State: AOJu0YwLyp3JP1AKs0FfCCYfkgVznKRADbierYa8shLqWd0V7Ex5hAtd
	soFS156kF138O6PdcLvCerAgJDTheD2o6sBgLQVlXkGHC3lsEh6P
X-Google-Smtp-Source: AGHT+IG8AifXoJzt/afMNe67tcFeiLrP5M6/urrkBJoQb1aUjJpqK75XQe++iygSMilFNcs3++wDxA==
X-Received: by 2002:a5d:6c6d:0:b0:37d:487e:4d9d with SMTP id ffacd0b85a97d-380612323c9mr8339382f8f.8.1730395402017;
        Thu, 31 Oct 2024 10:23:22 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116b181sm2703414f8f.107.2024.10.31.10.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 10:23:21 -0700 (PDT)
Date: Thu, 31 Oct 2024 19:23:18 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v7 3/8] net: stmmac: Refactor FPE functions to
 generic version
Message-ID: <20241031172318.w77ibjcz7pvia5wh@skbuf>
References: <cover.1730376866.git.0x1207@gmail.com>
 <cover.1730376866.git.0x1207@gmail.com>
 <1c05e448a12057b909cc6c7cc0c9645cf393d181.1730376866.git.0x1207@gmail.com>
 <1c05e448a12057b909cc6c7cc0c9645cf393d181.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c05e448a12057b909cc6c7cc0c9645cf393d181.1730376866.git.0x1207@gmail.com>
 <1c05e448a12057b909cc6c7cc0c9645cf393d181.1730376866.git.0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_102325_378843_71B03721 
X-CRM114-Status: GOOD (  13.85  )
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

On Thu, Oct 31, 2024 at 08:37:57PM +0800, Furong Xu wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
> index 25725fd5182f..15fcb9ef1a97 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
> @@ -12,34 +12,22 @@
>  #define STMMAC_FPE_MM_MAX_VERIFY_RETRIES	3
>  #define STMMAC_FPE_MM_MAX_VERIFY_TIME_MS	128
>  
> -/* FPE link-partner hand-shaking mPacket type */
> -enum stmmac_mpacket_type {
> -	MPACKET_VERIFY = 0,
> -	MPACKET_RESPONSE = 1,
> -};
> -
>  struct stmmac_priv;
>  struct stmmac_fpe_cfg;

With the removal of the dwmac5_*() and dwxgmac3_*() functions, the
forward definition of struct stmmac_fpe_cfg has no user in stmmac_fpe.h.

>  
>  void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up);
> -void stmmac_fpe_event_status(struct stmmac_priv *priv, int status);
>  void stmmac_fpe_init(struct stmmac_priv *priv);
>  void stmmac_fpe_apply(struct stmmac_priv *priv);
> +void stmmac_fpe_configure(struct stmmac_priv *priv, bool tx_enable,
> +			  bool pmac_enable);

I'm not sure why I missed this during v6, but stmmac_fpe_configure() is
only called from within stmmac_fpe.c, and thus should be static.

