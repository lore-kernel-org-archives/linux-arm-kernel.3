Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E12CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiIPZwDVa/FTGpS0Ac/pTVSem1bCOOPpbOCOtMlbuUk=; b=I+GtpuzPluyIvP/7TMuAVk4ifb
	X9SE+75XZTZGdgGucheXc6b8fCBZ4RG9OFU6eZ3R189ysyF8KjLIlxBH+MIiUbLMHa0dQtJef/+Re
	STHPTCnRIQqfCa9MZUS1LP8ZY49/2SFDgbHVaZU/YNUDhRMke3eEQmNI3VSNLaQ3Hp96/nKMp+Tld
	J8RC8SvKj9xWfvAk5bLN1HvYBylmL0X87QI6fBgRAy1LtvkNkFooXuO8/x2tJS41gTFf2ckIELuwu
	J1SK9a4K14O4KgGdKS4q0AlOhenY8SWNv1V1NPXD7ufA+wxLH/iUUANqwL19jdd+2+X02Drq2vWuC
	LMVd1BSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIXy-00000009Une-1wMM;
	Thu, 01 Oct 2026 15:18:10 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIXs-00000009Umj-2cYV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:18:08 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 46e09a7af769-821ff9f018bso366793a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 08:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790867883; x=1791472683; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PiIPZwDVa/FTGpS0Ac/pTVSem1bCOOPpbOCOtMlbuUk=;
        b=nwj9EdSJVfumoLMHcfGrFm73RorTb3fXqMv5kZAM2DQTaJPTobiUlVqw2qz5/49WKN
         xRDnjb56pVOF6pg11nbHfSN/ceDTUjwpSZ/f5y+LvHdrJ7NOvE/f1PKePTsmD8XC7X/6
         OvXxq3yCMl7r4rLurPk50h6KNRbn9q7Xrm/i70RhSG+dxy3abrCMgdJUT1A+sePD3fF5
         d+Np447q1f61Z78m2GPfZS9jLPZJh6pbCmaMdM9sn/RXJTe0dYihSn5XQIzrEBJcQFvL
         7Ly1DJ0jjUPOlWTrJ+7HWzADF9KoxtBCLxESsfAfAPTCg2Kt2bw8HeZERK6gFrMXKOP5
         4Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867883; x=1791472683;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PiIPZwDVa/FTGpS0Ac/pTVSem1bCOOPpbOCOtMlbuUk=;
        b=QplqQkKqakhX3IZfFhWJeY+7RLDw/EgSlByfvCytgoVxhWJ7E1CQBgOKEz6KxgcL6h
         vy9s3h9w+sZ/p3WbZjEAotA6QLJfivbAKSj2wfpKo5AyrfXDMtEAJaRxcGeu6DiivsJ3
         irVr5E1FYpF4Ickkne/KYF7YBndqFXXcnyG1eBwo7c1l3jpqLurFd0xa2JSo6FbJ27B6
         SGIw8GSnadaX8llM0KnuzLia2EVFqQj3pRChj1/WXVt042cinBHq1Zdgvg4yltYvwm2q
         lYBOkwW8Z3DHZKLdNDHLtlfPmAAECVn2qEFj84aM/9rnxyYmYNYs0WaA1Kn8wq+qj4T4
         CTUA==
X-Forwarded-Encrypted: i=1; AKwUvBxtFr4ZjOaBBoh+grAkxNZ6fwHO3DFhOzO0vaMS8eyK/Rs/Vdkw35qdpNacNBZZK+rQ5e1VAfHxSBWjaiO48s3Q@lists.infradead.org
X-Gm-Message-State: AFuF++m2IADlQx1+R5ZL4NpHKw9UAiVomhN2C5i8GKoBKJsimggwjiMU
	YlF1InCoD3ttdduRrUFqhnYzg7zpli3w5r9Og07gG9Jl+Mco+VQ+kvODKbHtTynqGDA=
X-Gm-Gg: AYBFou39knMgQugThMXi2h4AmV8F38dREwS1ZwxUk99ewdJY+KK4WEmdpDj8HYgUVNY
	2Ympmyatf8/YMyDYxv0ynwPAwTo02rC7aChWrBBztXIf0+G+8hhHsOxm9gQ0K5JJsLZ2LR4WW99
	yGd7SVM5xIFR10yev+FWzVqpel8aGM93y1GIyq+GC6YYIotcV5J03F5fMx3RsibmmGTYNgLmp87
	tBDUhYcSRFKX/6o2dNEJk8CDqpQ/I+YPLuYVfN8x/n7CYViV6X8K1q0HzoHpLtPbMUk8d18DOJD
	MNhJm8bd7HLAClhEdUCGk9OeuXcPEa8gfERRsUYrf50pQSC1Y9u6Q062XldyfQuRPKQg1m22xFL
	MDUhObWK0zz3rjvDBjy9I2Vgosu6TfO9+m9iD/cuxwBIcl5dv+42ADsjUy07LLxBO1m4Nu034E5
	FPNNAc7/lLIiF8cNBGZa/mvycImqV9eT9PCnivXE8gSH5B
X-Received: by 2002:a05:6830:6d0b:b0:813:baf6:c644 with SMTP id 46e09a7af769-8204b2bd01cmr6068580a34.26.1790867882898;
        Thu, 01 Oct 2026 08:18:02 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8227a56e124sm18793a34.21.2026.10.01.08.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:18:02 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xCIXp-0000000ENnk-1pv5;
	Thu, 01 Oct 2026 12:18:01 -0300
Date: Thu, 1 Oct 2026 12:18:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Eric Snowberg <eric.snowberg@oracle.com>,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, gongruiqi1@huawei.com
Subject: Re: [PATCH RFC 0/3] security: ima: support TSM measurement registers
Message-ID: <20261001151801.GC3019323@ziepe.ca>
References: <20260930-ima_tgx_integration_v2-v1-0-722c35370548@arm.com>
 <ebe68f6463f8ece8a5cd8ce70bba292ec4f64a41.camel@huaweicloud.com>
 <c4fe5315d70fc162f1e5648e3fccb1676710d5e6.camel@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4fe5315d70fc162f1e5648e3fccb1676710d5e6.camel@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_081804_668552_2DF65F3A 
X-CRM114-Status: GOOD (  16.90  )
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

On Thu, Oct 01, 2026 at 01:45:26PM +0200, Roberto Sassu wrote:
> On Thu, 2026-10-01 at 13:27 +0200, Roberto Sassu wrote:
> > On Wed, 2026-09-30 at 14:43 +0100, Yeoreum Yun wrote:
> > > Confidential computing guests without a TPM can use TSM measurement
> > > registers to record IMA measurement digests instead of TPM PCRs.
> 
> + Gong Ruiqi, of course.

We are working very seriously on this same problem too.

For some time we did investigate extending tsm_mr to do more things,
have a better uAPI, but that eventually evolved into the realization
that tsm_mr is simply too narrowly focused. It looks like James got to
this idea before we did. I agree with his remarks in the 2025 thread
with Gong.

So we've started work on a new comprehensive "Attestation subsytem"
that will pull in all forms of ROTs, TPM, CC stuff and SPDM use cases
to give a consistent user API to work with this class of HW. In many
ways I view this as a rename of tsm_mr (it will eventually fully
absorb it), but the name evokes the broader goal and encourages
everyone to come in, not just CC world.

Our overall goal would be for something like systemd to have a single
uniform kernel API that allows it interwork with any ROT someone may
have. A uAPI to do "Extend", "Quote", "Get Log" operations so that the
existing TPM support in systemd can be improved to work on any ROT
flexibly without having to hard code specific ROT behaviors into
systemd.

I've felt the ultimate end goal would be to make all the in-kernel tpm
users go through the proposed attestation subsystem so they can have
ROT and "PCR profile" agility. Certainly I've heard enough people
asking for this.

This is a broader topic than just IMA. For example DRTM also has to
use the TPM, and other ROTs. It also brings in a global shift of how
the system wide "PCR Profile" should work as post-DRTM has a different
TPM locality and access to the protected DRTM-only PCRs that are
normally blocked.

Jiri posted his current state here:
  https://lore.kernel.org/r/arzr32ZDComnfmny@FV6GYCPJ69

While we plan to start with SPDM and CC topics as the initial launch
Jiri has enough detailed plans now for all the main use cases, PCI
SPDM, TPM, "CC PCRS", CC attestation, and Caliptra that I'm feeling
confident something like this is the right way forward.

Jason

