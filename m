Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1DFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hk/1RrX60JDmdVrtnshWrtDpcwloR4SRE8DgWiROa1Q=; b=jHtlVHerj5yt0FbfytLli3LXZQ
	Z0UMhVgGgh05wPM1TcH4w7MVDm65bxQh9MKrg5AU2V0VIBQIq4v0478zuWW/ga1AcCnJ+zKagH2mq
	6gewg/pU6bJwREyefYJDKbJJsNaGqbvT00dmNNuhA8UzrVjRfiGYK1eYMm+3xvAlJIPn9tJCWHSof
	SLYLMy8t5PUlWe0F+rwue5MWfNH+GkaDcKDgdVjMFWm9Q7bZpQG6t1LMno81xRszgjyvDgJ4U01by
	DFP3IlrP3LlINi1BO9E82ouo3OI7KYL5fLGa8nRoXm/9DQqokM1ZEJ6hXDptNehNnHKUY2lobvmiu
	smy7UDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIQy-00000005iMe-2CfM;
	Mon, 16 Jun 2025 22:36:08 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRI8B-00000005g31-3FMX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:16:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2363616a1a6so39010465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 15:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750112203; x=1750717003; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hk/1RrX60JDmdVrtnshWrtDpcwloR4SRE8DgWiROa1Q=;
        b=H+cybdvRYRHcvpQQJEjqcF0AZ8gSWFdaoutTTWU7pH1J5swSIcNXRzmAnURxKP75Dw
         q10Ry2KIapaeQdcxFtl5T/vYDD1mc3R04TK7tEBQvIUY+6DGLIscNgNkloAG1Pxr29Sl
         3D/2sd7MhYwdsHp8/3oatw/n6Umyq7SPv85cEyxOmW0vtyuX+nHqwW62WDdBmv1puwsC
         6LaARZSxxyhpt/PSKEB4rBhL6fVLiKkb8flT3WEvhTHdHgep8psC8I8lMiw35xyn6jWV
         Fg65FAvePr/pc7+AwuralTOOc8FIGxM1ivMJKo7IGlJY25Lbx6P8KVwJRVmFUxM8eNee
         Ccww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750112203; x=1750717003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hk/1RrX60JDmdVrtnshWrtDpcwloR4SRE8DgWiROa1Q=;
        b=aX8ob+j2wPWWmByi5FZKQgtj7UOkgi84G5+yF2eQp1wniBN74k1Oxf0XIHbB2r+IVn
         Tu7J1tfMopQzeW8iS+ZvxXMEBgwduC2GlyDQkQsuXbNapdob/4hI0dIxEFmGDCYG1Iw5
         i7dcGzhBHnUVyWzPHBp0I/sosoVQOPPCz8u3Vot+hX5ZoayoD11SddVqoeecvsvUexrN
         oKqPrRZ6A8BsBVnKFSKSpKpG+Q3UJSdcnByafqMtgcuV4Y14y472uzbGshWuAWgXeseP
         hcLni7SuqU0UtRrm77z9x/M+tp+9qVNqztKFaH9gtEdLn5rM2tNArMffdrOXTpIMZFX+
         cYTA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ4wtO6oxWCdR6KVVOeQcKu50Bx98qVyFTtJ6rTQC8KIYIT/SiTJcI5Q1L5rwTdU1be5w5jqI8dWZbFLxYhtYM@lists.infradead.org
X-Gm-Message-State: AOJu0YwhgxMwV85fkBfKn+oCkoZKq1v6vtOMCs9DPXvbeIAjFkRwRwUJ
	+NUx6cBq9+/s4fAGMyp/KkH1T1EEizbVo+qcPbxmzzGSSSc8fJsH3SeH
X-Gm-Gg: ASbGncv/LL++T9XBl+FuDilkj74UVo6th+HK+A2Mynwmmx6d3IhYRP7s6n0Wq26CgYQ
	yjGQLujJKbcjJzpq8eushrNjlUtDuk9YuxNQzj6BRIypp9ZVUzz2trWXzXPjjYlkmco8Dxa5Ynb
	zBL3KfnizanXNxI1LQRWt0nX/lv8Xf9vrhE85tuV+shbYn15I6ADGLiBW4VvkObHUfrtXUcbMjW
	CNm+5DnsOaGy5Ty8tlhHQiZwI8GSjoyc8PdR5jJ/DmEAgrvZBSolKNPOOLIF27iTelUj9hR2RMT
	eCuc2pVv0fQYezKg2EkbNncO9FfIARd8RE4vBrx3XejKOdLq4mDRnkRNGoARkKQeJVlPcIWRVV8
	=
X-Google-Smtp-Source: AGHT+IH/vDq9MzidY2EpHhbnojUd1IyfqI+gwLmq2pgb7YkKLjm2cBD1/eXa2xI2DvQeLeHOp831uQ==
X-Received: by 2002:a17:902:f690:b0:22d:b243:2fee with SMTP id d9443c01a7336-2366b005d10mr141778865ad.13.1750112203018;
        Mon, 16 Jun 2025 15:16:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88bf0esm66382195ad.31.2025.06.16.15.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:16:42 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:16:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com, daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com
Subject: Re: [PATCH 2/4] hwmon: emc2305: Configure PWM channels based on DT
 properties
Message-ID: <39229deb-41b0-49ba-bd4d-33d57ab38ef0@roeck-us.net>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
 <20250603113125.3175103-3-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603113125.3175103-3-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_151643_810583_5E0BF51D 
X-CRM114-Status: UNSURE (   8.05  )
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

On Tue, Jun 03, 2025 at 02:31:23PM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Add support for configuring each PWM channel using Device Tree (DT)
> properties by parsing the 'pwms' phandle arguments.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Applied.

Thanks,
Guenter

