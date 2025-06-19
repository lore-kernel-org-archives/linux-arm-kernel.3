Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD08C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=se2zPaRHsPHVWSLq2M50PUR0Qrr63lHfyYD9MBXQ1JU=; b=jF5irUKqoTR01tlI7+3A6jlusj
	S90qeWvtXJCrmjzZXHeVPZNCuaR1gxBPRbrSlt6WAHjXRACy2tNCrngQlV0oZXbcROkRiCr0+OzGa
	ArvszF9DcGTeHIgLcIk/N6TJb9R24yQjzfO9vs8owvbavwyJ49vswwiVC5rNlxdo2ruqnB0tD4Xgt
	pixs+2Pb8Nx3C4GgKlzTYP/INJbLzn728uIWzH4201hm2r065xVlf0hl83V8Jx7Q4vCqxP5mLx4Da
	t+FsuQACrHYFJF8yxP5ol3cKLl+OfRm161QYx+XiVnoCn5a58VEPl0e06Rw2O+q/soscruLGToluE
	Hmj0EBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIfF-0000000DfiS-3Xb7;
	Thu, 19 Jun 2025 17:03:01 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGK0-0000000DHtL-2aEw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 14:32:57 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-735a8be4ea9so225963a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 07:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750343576; x=1750948376; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=se2zPaRHsPHVWSLq2M50PUR0Qrr63lHfyYD9MBXQ1JU=;
        b=x0seWK3MLfVpEyG66ZxeGN67jl07+ghVHnuoK87JPSRgo4pITu4gR6hizMVaJkY4Py
         WMyb3OaAMRgLUshD0DhvzcHukRXksiZ2WE3D7+vSF6Dgrt1r6jT8Mk9iz5RFnFRMn/Kb
         +XY7gKQBTtaT7PscYo6LT+GQGeySiUIjPVcVp/6f7HGZiCFhFSREM7W1Fky8N19XrkWc
         WsZUPkT/Tz9kMBwu11zgsZ3x+D5me10HPNgRU/9OhB2xl3efZMfrZ1bS3i5chYWmQkd7
         77I+aibJA5+k0fIwez7XZirUspZpxJK8FWpVSIIAOuoCwNdIRxTcF6viNcoF0BHnoIUF
         Algw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343576; x=1750948376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=se2zPaRHsPHVWSLq2M50PUR0Qrr63lHfyYD9MBXQ1JU=;
        b=W4yGnhSQ7F961OUR/1bCL7Za2LzYJgcAL+YHKIJ4wC/gmDE0z8xvxpbSpq2fTqSEyb
         HX/WEKAVeYqiVHuZu9G8pAvxUEuosOmOr09f6d+MCSRRS7zq7ntmjmjzsXYi8tV9e/Pm
         OaVo/KNCr46VRnqisXMzhlnVfbAZjrpO9R2tw/mwk8+cH+peUVSKBnaRaVVQmH3I/Jg3
         XWgRhFsUM5InBMZcJf+5uP9p6eaqNgdD5S2Ewi006CxBPCkiL0sRvPs3x8CQoPCt7xzW
         P7O8MGRSUlua14+pVDnxAaj9hcT8gKF6PGcLaF1ium+b66HqdLuaxdJbxEDd4vHxsPdb
         aJ9A==
X-Forwarded-Encrypted: i=1; AJvYcCUm+xLxyvsQoWpVqQhd9Exm0pdIli3RDilCAUFRtAI3zzxFLEJYKKTx2FrXS9AdvGI/Rfq3ZFiDshpJlUrZaYdR@lists.infradead.org
X-Gm-Message-State: AOJu0YwuEh833QAhOrFLeYY4lT7ulmh0RcJQpSnMjhKEW9uR/1wcRyrR
	hGkKTSYfujRnXFlGzoQIp01ITwzttCjxqy+wK98dx94PX3YWlbudMAnkrhZNqMWNXpyzSw3UOwd
	pbN5v
X-Gm-Gg: ASbGncs/D5hDUPyN1e4bkNFENPEuKq9kUUahu34ywiGFKrAlmKmWimTvAA7RsAKdMHG
	ceV5pNIxnnkBzphokr5ikMN0MScQ6sfS28KMg1Eucsn6aDEhDH6xUQspEh3BauW3c5xBB2CEgn9
	4mCMyAqFkqZDjFkNhevykpDz++lU5u01pVjz7tFIr8EOc22XAHSojiE1p4YDKhzwS2Rh9RCNgv3
	DySAoqlJPzY7Rk8z1W58o73K8GnPlgw1zhouuZoJTKSAzO0sVL53aYrYravYIuPdDEflGhXD6XR
	+WMxizvLMHFEW3yLGnicOY1E4MlJTkB6nT/T9KG2i2udJcP/YFt1o/nAmknQgWtTh4erWQ==
X-Google-Smtp-Source: AGHT+IGaZ2fGL+aupK3bJuZPDe415AnPYcuPEQInGDzraWvR8NsbfbrInyqqD6LAZae1EYAXTK0/5g==
X-Received: by 2002:a05:6870:468b:b0:2c2:5c26:2d8e with SMTP id 586e51a60fabf-2eaf06ae000mr13281654fac.16.1750343575695;
        Thu, 19 Jun 2025 07:32:55 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:67e2:ece8:b2f5:738f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eba6251d4csm354326fac.44.2025.06.19.07.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:32:55 -0700 (PDT)
Date: Thu, 19 Jun 2025 17:32:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, luke.parkin@arm.com
Subject: Re: [PATCH 1/4] firmware: arm_scmi: Add debug decrement counter
Message-ID: <b44393b8-369b-4500-abf3-13e98624e233@suswa.mountain>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250619122004.3705976-2-philip.radford@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122004.3705976-2-philip.radford@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_073256_654065_D86F7431 
X-CRM114-Status: GOOD (  10.41  )
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

On Thu, Jun 19, 2025 at 12:20:01PM +0000, Philip Radford wrote:
> Create scmi_dec_count function to decrease any of the Arm SCMI
> debug counters
> 

Please mention that "There is already a scmi_inc_count() function but no
decrement function."  Otherwise everyone will have to look it up to
verify that it exists.  Please put a period on the end of your sentences.

regards,
dan carpenter


