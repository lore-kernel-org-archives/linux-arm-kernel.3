Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9D7C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 13:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMRGU9D7jUOPRMQdlhC2i0jxS0Sdmf0wGcAUKJ73Z08=; b=4/vGei9sAzROayXdYoHKVu1Gb3
	yZrd/+fcthtNPcwYBmfRhkd/pm/ykY7N1eNlpyEbpJ/2ceN+/J45e1myeqi8E8DG4kvAqg2ZaSjnf
	jhWDe/3hWPqRPRFITKwY2UuoBRUZSY8gG9j5qAnaOX7vSJ3VNkeQWRq5lN9gKYddZJDz+/PxtcEOM
	Zawd/OJTGQkTeySwHWUAe+Xkn07g98lCfaGvGYfVkH2jGQTmRHWSYj9unByMvVZvledSXoF8qTw7X
	/t30MqiKQ3kuUKffAayMnfGWSUgS4UyqLea5ctqpQquAv1Td086/ShxLgwrkv3Mkgt1HGeLciiqqm
	Eh9dwRoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLit-0000000HMBx-3oX8;
	Thu, 16 Jul 2026 13:01:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLir-0000000HMBI-188l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 13:01:54 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47de0093c42so2707047f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 06:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784206910; x=1784811710; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GMRGU9D7jUOPRMQdlhC2i0jxS0Sdmf0wGcAUKJ73Z08=;
        b=JUX3Cy4sxEZEsqHyBc/1b17E9Dp3o/X/smllbqxCptA4bfyXhF0KOV+1Koufn+qAsT
         dnUP+VELKFx2d0FWvWYQcLHW7C0429YxictwTckd9Gwrt2xpIgDaANjH3xZlK6k+owYp
         5ZANI+t4z+rvKo1j1vig2JAhXhomuPl159ZfA0FSCvp5+XmDr89fx8PWqLwzOuawSNnJ
         Nl3voYtfUlhRI7G55SvOoOwVPU/rtYqtwrgFYPFDic701Rf5dy3zR4IFv8oAU3fU7m7Y
         71PBZ3ApsTBDujZ89Db2a+M3W0chSBEAYmDanVyw96N5dd7GGQd2eb2weci66/dgGUU/
         E80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784206910; x=1784811710;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMRGU9D7jUOPRMQdlhC2i0jxS0Sdmf0wGcAUKJ73Z08=;
        b=Es+p6sbTUWQukGmbJF+t/zK9GPJWXpQEul7R3w+skNsPjWT265abTcn4ixh9RS/oVS
         IzhIKhrp5dpmfgelEm43ebQYXKKeS0vNrbZdS514b5vtD86Rw7NtDL6NZ30et8L8+l40
         DDCUzpLIl/1YgtKX/Vu+CukIGY6Tme6bGnOtkigRebQyHSVs5NoN4+CenzBlx3LuIfWm
         YgHh9tM3216wPzFT+qufo4/1c9DGnCAn3hvQNOmPYaE65Spfn8JzFz/oEJVlbqIhspYr
         +wuI/6UruBZmYhw4RE5o0lBw4BmPhjPyW4rEbaK1IoXwOfJc594CpSSIEx5kzKmnbvK7
         wr4A==
X-Forwarded-Encrypted: i=1; AHgh+RoVQ52TCEsS/ESC1VI39DU1cKsHfg45qqcMjTuX8PbqXa/WiIwz4iTTtYJLjYdqql9aAxCPSUw1P1I8JVtVp2vO@lists.infradead.org
X-Gm-Message-State: AOJu0YyWcwPRy2t7e6dO5C5IjZm4M+lbDfhxA8brXMGQkYmQC4mfdBIe
	5LHWc+c+usCFEfuW0Xk8h1Gkl2vkpJD5niPuuSOt7OlD+F9czzmFxEzWtOUpRjxqbjQ=
X-Gm-Gg: AfdE7ckvDkkpTIvKhThBE8hevLqdILZuL8NVjRgSidAhFgSpoYMZ1zDB/vtRlKUvPNN
	wvRGrQ2smUcb+KYktCgI3SDxJWOgBEe8g+nsiuiXpYD5vAaWrJoa0D+CxGhO4Buap+tIW3abAke
	vchLJfXG9hlQRB7rTQ9l/OjsUYcAwiUv97Z1ogt5gEylzGykWZOGKA8BtFo3rXngtHfw19XVmYZ
	fS6aDW9NtBt3woJQcwDYoSD6taKsT3XfOKGX8fiCldhVQM6Dh20sNsIqlpgVUa0Jr+EzgVAIG9G
	T1OAen9aw5Hsm0/+Ebis5enI6DkjF5nJ/k8cjsHZ1c1IvkyKDCx8V08a855qZNiCMwTkdgVFjV9
	WM6vUU3jwnFT/sUQrHQKDpoDAGlbpt+Wi93BVvYlZ3azih+x/M8Y7NIvrqSIUnt+8jGwL1jj4qm
	K0j2OM
X-Received: by 2002:a05:6000:24c6:b0:47e:1d9a:1123 with SMTP id ffacd0b85a97d-47f2dcb604fmr25617566f8f.3.1784206909702;
        Thu, 16 Jul 2026 06:01:49 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e0d9sm23377950f8f.2.2026.07.16.06.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:01:49 -0700 (PDT)
Date: Thu, 16 Jul 2026 15:01:46 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 1/6] printk: sysctl: use unsigned int for printk_delay
Message-ID: <aljWOsuEfks9mYql@pathway.suse.cz>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
 <20260712-printkcleanup-v3-1-574547b8f71b@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-printkcleanup-v3-1-574547b8f71b@thegoodpenguin.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_060153_306078_B0C08BD5 
X-CRM114-Status: UNSURE (   9.54  )
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

On Sun 2026-07-12 11:20:32, Andrew Murray wrote:
> As the printk_delay sysctl represents a duration in milliseconds,
> let's set its type to be unsigned int.
> 
> Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

Makes sense:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

