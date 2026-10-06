Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3564FCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4I8sJSiMLDYcZ6HuW+SMx62hAOh6BihMSim0ZcE8Eg=; b=pghJn8jbEyVoyMZI80hrX3TJei
	nbzbWmt6jyeyu+4O62KVXnKOpEYThodjB+pTYJGsHQxEANaZ1+D/3QxpWK31r+JiCKb2IE/ie+EC6
	YnFBU1buV9NyAkUZiPWtyrm7GYFKPX33qu+Z43hoF7cc62BMuYAEJA+iJqREq2blotykstAzCMnK0
	6VX21hd4NbTdhpqGjNv2PE33oUYlGqBkNneB+WlNYVEkUB3rDy/UXXHRDJqN3X/X2LM+p6w2omD+b
	tUzT2+f96xyOF1L6WZUN1Gax8XAkXLTqJQI2qHldvF+RcaTL+CF+Dky4lPWI6s62YVHAUKiZeEJM7
	wAk9yhtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7ry-000000017gJ-2Ghx;
	Tue, 06 Oct 2026 16:18:22 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7rv-000000017fz-2cbS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 16:18:21 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so35262425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 09:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791303497; x=1791908297; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j4I8sJSiMLDYcZ6HuW+SMx62hAOh6BihMSim0ZcE8Eg=;
        b=RF2Rg8OdDuQSVDe/AtIGknHmmUmPPCpE0VHEDXGWoqa3ykMCP+/VaCB39nLSrRZvrs
         g7yVDo/mZo3PWbJOdyULPeq4ApqfgCeCKUuuTKuoqXcMuyqmIfqtPKbhsd+wsXPd7+6N
         Q0+OI7iuSFn1Lz1kFDr9cZkX0KdVjU9Y5UX9U5gUyMiiMeGhXsC6LTenqold3DEeIU6v
         C1htQUBUrNUdeGuOZcOP0Lh8s2W75xRm7KoEvzFvZWSdWzFd8rsKUUxNBkPsAesb2pQR
         8Yzo+ldkPWVKMwdeDnaCACM9mm9M0by+Y+7Te5AQ/d7IEYfscJArt6O+0YtVzU57XBRc
         XT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791303497; x=1791908297;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4I8sJSiMLDYcZ6HuW+SMx62hAOh6BihMSim0ZcE8Eg=;
        b=j6RoauORu1l6RiIjoN0xm5S3L1YoFjDWAeND5Fxi/zUGaWnDnjVUW0Vt2Sm0Z8HHTx
         yvD8qIBUwOwQpsM9ZwPtAYwrR7U86l+kEizJsNK+6PoHR6nqcn3FcRvjDtZN/IYKwmK9
         lHSuaeaSlamTYhSXptFWsStnqwrJYceJbk4Q9qLDJvWsR6c8CeS6L6iz+4rwf97s0Q6B
         PPRHDwWui9PLdNuX50dvVCe5H1adygpeRWiUOUJ0NogYCWXWYXHIaTPxCHOrFqGy0pO6
         GgI+8Kop/pJFB9wBp7r0l7MjsQOXti7wwWE4c6JFb+4NTCXDMFCnVCeDSH9VAklrjZqS
         M21g==
X-Forwarded-Encrypted: i=1; AKwUvBzJXAe8Jo7hEnT40hcsXxAP/uNoVH1XiNXfUfTPuacPiZMFeX0UaHTR6OXCxE6M/Lucf1hITmQh++TZGgn++jDF@lists.infradead.org
X-Gm-Message-State: AFuF++mRPbDsysdS37N/hgC6pbpIwE1ofMc9g67OSfcMV5CIZzc2B374
	Gd6jgnrV2H0+fDYgUpHlyAtlUpSprFRHR5yo6HelrjAOMKZUEIXGfopjy1chsu1ZfsU=
X-Gm-Gg: AYBFou2RNTVFbFev08VXs07avewJY3YB56+V8n1zljGtQBlnL5+pJgD+l4GecCvUMjC
	DpbE34wWmtgaL7i+MvbYKWMqgJ5/SyCWbN7Mlha9tkEBoN+2+6wIbUDCmfBb5fofgFmGeYSBGu7
	KMnj26/2WtHoUpcaEVJV0+wtJQlxGmAkp/NQ8DpET9xlpi+xxaSulctw8RsaWw2hZ8SnpOfDGQe
	LcT+3/YRocKGQml+VwAc0Hv1jELeU7mGgar50Pa+XY3XEmxo0boTP7pble57h2UWPu9vUTCS8Q9
	dhssQFJ6RxeMAy5Rtp1NncWLu5NJo8I0TdhH8vZyGGPdT6nkJOpgtfN+7DHi6EWh1bm7zwcGWNv
	IIXwmLlSx2A2ujv6Jjnn+SgueKpDmVkXJ18YsbiSQKCBUmaHyoD6OF2vn3cMT/GsoR2+YNUsiu4
	CYP2Egyxx6NywBkQTfhw7LRZlyPn0gklWXci7XD30kkFSoYb+nEV9ack2LCjN1/7zSTQhJxy6Hz
	apMz4H+JKUH+f8jeFzOT1JkNnmve+Hc46VVG7RenlUTwx5zu1aWdbrWPYbMET+Jht1Vsvt7uQnQ
	+Y627Rfs4pZPo3pgngfvgWlXXxcNruRO+5k78uv3bVGkMYQsl+L0CLTxXmNdokDtpdhQyg==
X-Received: by 2002:a05:600c:4e87:b0:4a0:2375:dc1a with SMTP id 5b1f17b1804b1-4a1680ece49mr174863895e9.21.1791303497306;
        Tue, 06 Oct 2026 09:18:17 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1794a1af9sm76346415e9.5.2026.10.06.09.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:18:16 -0700 (PDT)
Date: Tue, 6 Oct 2026 17:18:14 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev-bot+sinfo@kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Davide Caratti <dcaratti@redhat.com>
Subject: Re: [PATCH net-next v5 0/3] net: stmmac: Introduce hw queue priority
 offload
Message-ID: <asUfRhPF-J74TCgG@aspen.lan>
References: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
 <179128376932.2231598.7510820392039419594@kernel.org>
 <asTnyCWBTMC-B191@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asTnyCWBTMC-B191@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_091819_943269_B08E14C5 
X-CRM114-Status: GOOD (  16.37  )
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

On Tue, Oct 06, 2026 at 02:21:28PM +0200, Lorenzo Bianconi wrote:
> > Hi!
> >
> > This is an automated message. This series looks like a fix, but its
> > commit messages seem to be missing some information:
> >
> >  - Whether the issue was actually triggered, or is only theoretical
> >    (e.g. found by code inspection). If it was triggered please include
> >    the symptoms, like the stack trace or error messages.
>
> This is a theoretical issue found during code inspection.

I haven't triggered anything specific for the real_num_tx_queues changes
but the overall with/without mqprio offload changes can (and have) been
reproduced with netperf:

  netperf -H 192.168.10.2 -s 1 -l 12 -y 7 -t UDP_STREAM -- -m 1472 & \
  netperf -H 192.168.10.2 -s 2 -l 10 -y 5 -t UDP_STREAM -- -m 1472 & \
  wait

With the patchset applied (and the traffic class 7 mapped to a higher
priority queue and TC 5) then the split of bandwidth massively favours
TC 7 (with a 2.5G link. TC 7 measure ~2G versus TC 5 at ~2M).

Without the patchset both streams get ~1G.

I guess FWIW the whole series is:
Tested-by: Daniel Thompson <daniel@riscstar.com>


Daniel.

