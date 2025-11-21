Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5826CCFC29A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 19:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuwsRCiJEfPqcQBjl8MxdvP+p6un2px2w+qwWN+KPP4=; b=vAauztliSmaaS3XYWg61v9SAxd
	uevxUfxdaoIioZoKwgjgdfIoGC5B3qv9s6hN1tGX3uUi0Xr8XpIeI739oN8PyrWdn+HE7YwgO9yTw
	/blpii9QWIt1QFsw2qL7qaxE4h2qBCXJnDeJJyh2C5NjYByP6IGYIebd2DigETSjpeX5eNcCUxA09
	IsFFd5C/sfJ2rqNx0JFxaRv4AHxUihQisRxH2alBp9Qy1Txg850ZCF/vuxltILq6ZqgS2oGk70Cy1
	kBoscpNSS3epLf8nGHM70HXW2CxFz7puzcAT7z5vRDsZiXqzPeBzzhM3vzCyGGH9/MSb9pyO/eCdv
	1QRknYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWh2-00000008tcI-1JUG;
	Fri, 21 Nov 2025 19:21:16 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWgz-00000008tbc-0OSh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 19:21:14 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo2728720b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 11:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763752872; x=1764357672; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuwsRCiJEfPqcQBjl8MxdvP+p6un2px2w+qwWN+KPP4=;
        b=RYXOIS4W+S3TBwrLoCDsnWf71iCtC70NwZcOaPJjlhASUjdia81nkS8YjAV9Z0MVS+
         qGwk8N1eyZXMMyQQIm9u4RK7h+fktOGQq9eupLRRLBCY77iVdcmovN3vrjNJzXhmU0YG
         X6jhTFvpCJxx44W9NQQZExaczh8+D8QmsGqb6N0YQF/dowy+PMveyWFa6Jyvk916z6LP
         jH/BEvURWA8WmLmK3S4mqBYC058dGGLn2DPKMRHnPVEFyroeY8GThvQi4NFHQk2w4s8f
         spNowppo32O0X1fCYYdd/DUUdAaiiRPUjoHAORpWih6/1hv28Osrbt8bWgn35IqS+/Bl
         LAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763752872; x=1764357672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PuwsRCiJEfPqcQBjl8MxdvP+p6un2px2w+qwWN+KPP4=;
        b=vtz0Etv9foOcP8ctL548d7ZSe8+gyrJ7CYPZlgYC9aaht556+hG9bGNH6wKYzVWl6k
         h//hR7u2WWV9NXQ4BpaXJf/N6PeY1ixSxn2YG/3t3mnXyrZ7PJI0P3rKiW7Rf0WKLC1L
         ltAFCcs2O6u+CgZP2WK9WNIH0Y49KubPnZ0Z+fFPhjDS7qJlQBrmJT5rlR1BsUFtklg6
         ZUW35skIu6aCau/5AsoMro3hiTBg3G+0EyUEL0zykF8UFtePEKDjxzIxsseLhrodaT+n
         jOnhF9Lskk9hrKBz430LNYZWhuLLMwAlYAJYlh1Rd1lUXgfMSZYvuYF8fTdYSe5WC9rY
         45aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu1z1kZnqVN6lTrOmlt96MYoD08gWnKAzNXyPcOgUFIIL+mzPoMFJe5yUqnU+Ky7MCen4lLJrpiaRwskwdtwmX@lists.infradead.org
X-Gm-Message-State: AOJu0YwsyPoztUsfDXbGc40AFD7h74KKKhf3dh9mxRN8VBPdEe/YVZIA
	McCG5n/bdLNhVKIAqJ25MKJOnknsoY9nmT8HMvsDazMwzsCf6OBv7hgW
X-Gm-Gg: ASbGnctYchkwMYtBZYX7EDV5sFRD7JHmsOLsn1IjOFrlokgNgnTpA67rV94ajEu9+kr
	YpyAoQ9HT6y/6j/Ka0VfWSqrLg/FFkJc6T0+8UDim5ieDtLtKGsM1qVyBnNZkRU8AUUuAGbttvl
	A4edsZW2jaxQBbXwz9AfInx8/amh+rZlBP+wX7LGJG8YuDsMp8fmXhG2g6BoqBIEeIrGbgvrX+N
	74PjmOfol3Ha+/lajsaIvcWWtyD6XkcPz64g9SDIBjQ9pHDTU/eOLM2lu1x2QokMQpvAE0Nas05
	hd04KjoNZOT0pX5e/m4nKiHArtBeOOvKnLg58k/95AYjS4u71K4RIja0f+JIRQN0B4XQ7lSpYCp
	t33EFZTAGk/uvHaWx0AtomVFSQuIagcEGz7Erx7rCTCa6nICU0h5FaCJhF4scUNUmTsiXBCyhkq
	djMuORp+nkd06I68W4ayWIcow=
X-Google-Smtp-Source: AGHT+IEL7H1VBi7kwbJmZG3DtyIxfrQ9k12/GSEXJJ2L83oQNAI/YlBkWdpeqhPFCdtjoHJfPOpsbw==
X-Received: by 2002:a05:7022:6729:b0:119:e569:f258 with SMTP id a92af1059eb24-11c9d70a16emr1089561c88.1.1763752872115;
        Fri, 21 Nov 2025 11:21:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc204881sm25316159eec.0.2025.11.21.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 11:21:11 -0800 (PST)
Date: Fri, 21 Nov 2025 11:21:10 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v3 2/2] hwmon: (aspeed-g6-pwm-tach): Add AST2700
 compatible string
Message-ID: <30d139b1-05e9-4629-8a95-95991849fb03@roeck-us.net>
References: <20251120-upstream_pwm_tach-v3-0-eaa2f9b300a2@aspeedtech.com>
 <20251120-upstream_pwm_tach-v3-2-eaa2f9b300a2@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120-upstream_pwm_tach-v3-2-eaa2f9b300a2@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_112113_136774_46CCFD5C 
X-CRM114-Status: GOOD (  10.83  )
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

On Thu, Nov 20, 2025 at 07:12:32PM +0800, Billy Tsai wrote:
> Extends device tree support to include the AST2700 chip variant by
> adding its compatible string to the device match table.
> 
> The AST2700 PWM/TACH hardware is compatible with the existing driver
> implementation used for AST2600.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Applied.

Thanks,
Guenter

