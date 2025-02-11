Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E957CC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uWVDSjgS6JIISR3Ig9ZHEbq8J0PF0Iw5i8ZVq3tF3Q=; b=ck2L4ghnfO12Kp5cfZEnJt0UfL
	9lICk3W4y70zfOMA20sxOYznBj2pOU23gl3m6Rf1cHNACQbXLdAxOQlfetQBhZ3OTwn/MtEfIpVyZ
	kZgAlr2SlfPNS4+H+M6OJXPG76+7s0ifN+OMzAciXoGxvsq53VfirolrG3qkJYTQr00i4GN4Ol0s3
	E4Sdv8ALX/Kzy98EsqWUEOh4cCwlC3/Snw76byoK84EVivPzVPEV9bYT3SiF0LuVBQQfq1Mhll6k0
	XS57Y0rwUFcDZ2Abi9eA5XEWhs5nundWZEaFoSBCJpDx/YUgPKPtKlh2wfYEfruU3vV87Evd7NfT4
	dhFwA/yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1three-00000004CLr-2pC8;
	Tue, 11 Feb 2025 14:54:28 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thrWe-00000004Ayi-3m5r;
	Tue, 11 Feb 2025 14:46:13 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab7dd005cb0so17209066b.3;
        Tue, 11 Feb 2025 06:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739285171; x=1739889971; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6uWVDSjgS6JIISR3Ig9ZHEbq8J0PF0Iw5i8ZVq3tF3Q=;
        b=gTqgiTPIMiHt31oGiC+G1CljFFZbEZODF3VilgGRB3Q+iJlwiZl40fVe36BhUC7LSr
         X7nXVo2X1bvAXa5HbHoELcT+QQxPoc62VYDmfq+BNYCLcm18Op+7HjQ/Es8Lb305eUz/
         ddgH7wYdRiqv14DIux5cppUtxrfQtv0t9E76Xa6/Fk2Z//vFXy/PB9FxOR4BxVCAP3x0
         v9QVZDP4oM+4XK/jRPqRCJ+diBJnGNaUOGRNTzehP5EdQ2mDH0YLEkzTlDJNqDCTKBVf
         e+7NlAo3p/PRSFizdhEdhhIgpKDP3UOOkJqyuKdT3TP4MRNxkR8sWumzcMNy7ohJgIWo
         AbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739285171; x=1739889971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uWVDSjgS6JIISR3Ig9ZHEbq8J0PF0Iw5i8ZVq3tF3Q=;
        b=YpZ5S0VAXYRxhXiMMRolEhhX8lAwJXOnWsOqbRbqeG1MHXrVtp0AFBLYk/PImOmXlw
         MxTiMswn6n4HSUmaIK95DkDXxSi256fiW0Q5PhBfO5HlqhLxOfEJ8hpEJwLjOGrKwddE
         /Wy/toeDlTvUDChhTX+7tMvY0jVldA1htgudNOBhOnb2Em1a8FDTBS++3/MQPAMKiSoy
         q+j61vOYOeCKsPPG4exZuyyry8QKmw4/BxwtODSeKi0UtLZ/oVB2rxik4SDkOEfgeEBD
         RSvPu7m3vMfMyTSHHvaGE7dApPyeT+8XDTBrt0Qpm2w4deH1ZszCqfAsxHXxcYD9qNsG
         cu3g==
X-Forwarded-Encrypted: i=1; AJvYcCV6eZgpExVOfVovW/3PvGjoF/sUpoiAj8x7gY1AZMFzsrSPMaNjRBvaDVAQe9JHouXttR1nwgbUCKDCijgec7ly@lists.infradead.org, AJvYcCVkvwcbEggj6ozBK4T6qYwF3y0r6vA1M0vT65sXDzV/pG7dimraRk3U0UFpV0m6ygj+gtBmB1j8FteH8bRwULI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNNufYgN1GnCr+6qdkvYSFNu9EZCZar22FZTnWuoVIabeS4iEX
	u5FzXOfGws/WfPKOxoGLfyIW+cK6warGqugGPgAbMQ6AyR04Qd7i
X-Gm-Gg: ASbGncv39ircAuj+2OIBsyMNndnUmdNizdGdhjWCr/uDDII1gEW55W1i4+lqKiC/eXw
	SGdD3Iw1crPwa+jcFlEEUOdnAKOOjC9DngHE7iMFjgU6DEj0goVnRMVRN+AhJa3+gxNI7yDuoUC
	VWvhXeKgQoZhvdBhgfTJ+KNGFCL4HzIMXE1t6m0mejEhLFTgBTMR86opn//2HpU/to9+ZvvS7X0
	d0Mi7wZu8s/H87vfyvefyEkdnW4aEeq0qPaz14IsuvJhvtQBvTp1F/tTenqSukCin83sbnWYPKg
	X2w=
X-Google-Smtp-Source: AGHT+IERuaTSU0FjfFqdLB/FrYmkIXox+hXTzqKNJOTUEB7oHG1m+Cn9NfYp8r8pLkOryAH3/WRqyQ==
X-Received: by 2002:a17:907:96aa:b0:ab6:eec4:c9c2 with SMTP id a640c23a62f3a-ab7e0eeb604mr95768366b.7.1739285170925;
        Tue, 11 Feb 2025 06:46:10 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab78e561ba0sm898239966b.137.2025.02.11.06.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:46:10 -0800 (PST)
Date: Tue, 11 Feb 2025 16:46:06 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Joe Damato <jdamato@fastly.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v6 net-next 05/14] bridge: Add filling forward path from
 port to port
Message-ID: <20250211144606.ljj2rddz32p6gooe@skbuf>
References: <20250209111034.241571-1-ericwouds@gmail.com>
 <20250209111034.241571-6-ericwouds@gmail.com>
 <20250211132832.aiy6ocvqppoqkd65@skbuf>
 <9ae3548a-844e-4449-9c00-5dd79e804922@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ae3548a-844e-4449-9c00-5dd79e804922@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_064612_938844_A6ECD824 
X-CRM114-Status: GOOD (  10.01  )
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

On Tue, Feb 11, 2025 at 03:43:22PM +0100, Eric Woudstra wrote:
> Thanks. I will correct both in v7.

Please wait a bit more for v7. I'm trying really hard to ask a pertinent
question on patch 11/14, which currently I don't understand very well
what it does and why it is needed.

