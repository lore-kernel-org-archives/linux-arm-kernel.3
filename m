Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B87CC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 06:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xC9CFEE+YUx312k0/EiyveI/Q/YMtl8Jwd16dQuFXI=; b=AFTDWy117S790oxhj00r2TAL/9
	O2dRYfFMJczE4qEjulSyuB9+ER4wa2f4AuYZxewodj1YKiViHgxLQRXHyut6IOX7pO60xyxMiVLGE
	WtbIF9lBYMcFbnShx3WbWRwW7o43CsUR9t2TiERYIk9/1heRexXd9WVMT8spPEy2CBtWQnm+0r08l
	H3WTwAEQOzsl+LEeIk5/qvL8pvcwfSQ2oUosWiViDhMNmgVA168o4Fmj+t/LRUvJf/NSKTi/B9Rfg
	r1ISjHII840z+hWZYG80zmR3rvbJBQnJV6dNdGph4A+RLFSa9mpNHp7YH3o7Lhe0u6ct1YUQGtroN
	kwmncHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLFUg-00000003Q1F-3UYm;
	Sat, 31 May 2025 06:14:58 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLFSY-00000003Pr0-0UJM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 06:12:47 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7399838db7fso2545527b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 23:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748671965; x=1749276765; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0xC9CFEE+YUx312k0/EiyveI/Q/YMtl8Jwd16dQuFXI=;
        b=lOpje1LgYrFr6FMkg8TiTSHL1DszRc+V46KW87R0vkXPW+qnwhmNKqaGh5ds+3GNJR
         6ATm3fD31GqiffpkkHNuRhqC1XIg0SbWNstQY+q5XuX5qOX96KsTbM6BBYkZ4cSnwkLJ
         fVG2g7bfN/4fO6og4kbJlxxKuvD1426oaXeVYTI2Fa3Q53eSDoUCyyFxVwJGm19h3CgN
         ap1sG/FrmBms/rzKaoLBTg8scc+GldhlzrrE7TDM1TUvf5nPduroaznZzl4F7Mh8FBhf
         JGl+TuMy8rrhIlFSld6hrbDsDI6h6FfFZfGb0HlMrrNGgUCFh9gttNEEUALCIJh+9UMC
         MryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748671965; x=1749276765;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0xC9CFEE+YUx312k0/EiyveI/Q/YMtl8Jwd16dQuFXI=;
        b=GiwEK6OXEvVhOdLMZGW3HEoAeTBiuYbFM9td5Kp8pbM+Pbwu1Ot7ortTp7ek3uhk7Z
         U9RPE2UHXE4sxGJFDDs33MAlwIMsqNylHeJGwEWJwPwU0sertAv9Gbeor3SJ49A1CJwn
         SQNGDFhRzBMtEFxtcU1oMeBA3yH/ehegXX4pbypseScl7qQmJ+3oIZ2z7WXmpEpLXz+C
         9qC0nJS9U+3PItygQTmUJngcjRfsD32IH5b5MbM3Ec3TEgV5zXPbEPgt59xj/suMb9N6
         kPnKS0TYvjh78Nqa+9OBB7DTxJ0DomH35YzXO0pbp5UYN1PoZRdeDxyYr8a9kNnrqKhp
         DXcA==
X-Forwarded-Encrypted: i=1; AJvYcCV+RYcYPCOxOKzfrXhU9KncUFP3DBzen5G92x6djcllaFo7aqINia+zxc7PQPKhQYiCJhUalO70w4/Qw9/f8Pd1@lists.infradead.org
X-Gm-Message-State: AOJu0YxuWLnOoLk34EgQ4npppZ+IWWOpdGf4IOImnqlywtFFaNG+W35A
	JllheR7yWSVzU5738FjyPZarxDQ+Tc42ijcCar1XR2O4x8YyHxaKoaBFNekutiG6tQ==
X-Gm-Gg: ASbGncteLp0Zpx7NU3xBpXZgSqge47RJ6BHukyHZQzpGPOcsDLuj54iX4xNlqK+BPG8
	fiFhcG9mfs7gBnGVSehteJdI/cCxMFUVmqw1ITOLIwNuiFJqnTVcSPUdvPy6hSOtF96BLn8B/mQ
	d2TZ5sbb0GVSRj5hyzDv0ivPINa28O4mprptUQEnxyiYt9KXWpfaFZTHOJo51LkoQ4cpS7uZdpN
	/lh4WV+nxJiaCq2Ra5UR71rMKaO3+lReBoKSHFYpKxSaGLsIfyDMvaj5AyozXDwzu0WtAXDg3j5
	CSsKWYAIs3Tr+gpYbwq1wLMY3yZbAc9R0cfPhrHdoZeQSUJ6MVfNxNAAetCnkNQi5SxYirrt
X-Google-Smtp-Source: AGHT+IE96H8U8bWE8z0seGlz+ce1VhCU9n8V1B9SIIp0uy/rKpHh593gOPlHdV8KFu0tdA5IB8EsVg==
X-Received: by 2002:a05:6a00:8b09:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-747ad757dc4mr9023047b3a.9.1748671965098;
        Fri, 30 May 2025 23:12:45 -0700 (PDT)
Received: from thinkpad ([120.56.204.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcf4c5sm3950187b3a.124.2025.05.30.23.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 23:12:44 -0700 (PDT)
Date: Sat, 31 May 2025 11:42:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: shawn.lin@rock-chips.com, lpieralisi@kernel.org, kw@linux.com, 
	bhelgaas@google.com, heiko@sntech.de, robh@kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Fix interrupt log message
Message-ID: <hjckb2qsdz5atx5occqv7m6syg4fnilxhmn4zeq4y5yoqkmdjf@66gudl2chlgk>
References: <20250516145544.110516-1-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250516145544.110516-1-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_231246_170780_EA5B1598 
X-CRM114-Status: GOOD (  17.59  )
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

On Fri, May 16, 2025 at 10:55:41PM +0800, Hans Zhang wrote:
> Dear Maintainers,
> 
> Detailed descriptions of interrupts can be seen from RK3399 TRM doc.
> I found two errors and cleaned up the driver by the way.
> 
> This patch series improves the logging accuracy and code cleanliness of
> the Rockchip PCIe host controller driver:
> 
> Log Message Clarifications
> 
> Patch 1 fixes a misleading debug message for the PCIE_CORE_INT_UCR
> interrupt, replacing a duplicated "malformed TLP" message with "Unexpected
> Completion" to reflect the actual error condition.
> 
> Patch 2 corrects the terminology for non-fatal errors, renaming "no fatal
> error" to "non fatal error interrupt received" to align with PCIe interrupt
> semantics.
> 
> Code Cleanup
> 
> Patch 3 removes redundant header includes (e.g., unused clock/reset
> headers) to streamline the driver and reduce build dependencies.
> 
> These changes enhance debug log reliability, eliminate ambiguity for
> developers.
> 

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes for v2:
> - Drop patch [v1 3/4].
> - The other patches have not been modified.
> ---
> 
> Hans Zhang (3):
>   PCI: rockchip-host: Fix "Unexpected Completion" log message
>   PCI: rockchip-host: Correct non-fatal error log message
>   PCI: rockchip-host: Remove unused header includes
> 
>  drivers/pci/controller/pcie-rockchip-host.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> 
> base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

