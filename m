Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98809D1BDD9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOpQChbady85VjphGfbgQ0josSjOZ9BtFVZ3HbNMAFc=; b=3kKKAW4ibQOjO2vuwbovB5FxK1
	UnYmSMCBWxS+/Xnt5xE8cQSdDiiGJz4HpSgo8KYCb6Rc5N+tl/NXpMl6R+N2b5kEIhaPkgu7C1tuf
	6SzKVCL5+7nImKKp5oGuLKfyX/CyC8CnSFu/iabC/vGYD9BbnG9aQFBTn6Fw85ykufSqPbj+b/5a0
	ox6dnzI541m7f6tZK87D1ZsKPpVyCcUTMi991pHMcNRQ+xiHQvZ4uTfhv53RscQFeLt848CJY5SDH
	aeBAepP9oaednNGuRlZO37IrFUTi8bHBC97qTa/7Mjhb0UN5+vNhKka+C0kkCMOhJYhK/dkIDJj1A
	p5bGXPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t81Xj-0000000EfrL-3NY4;
	Mon, 04 Nov 2024 18:11:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t81By-0000000EaWF-0099;
	Mon, 04 Nov 2024 17:48:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0EB5EA431F6;
	Mon,  4 Nov 2024 17:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1421C4CECE;
	Mon,  4 Nov 2024 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730742520;
	bh=kyMZ9fV6X+51trgRY65w1AUDjMP2XEnEX7GkvQFyuQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RG0ZZ45eSLTeSuURvGHB3h65F9t7QbkI04hRi4PIn9RQya+KVuOq+cKYwcM7OIRag
	 ftffa9p0RPzhxKxbKbO1phJPPDnrPKDiu3Z4Itvr9Wls0R3DzSPdYDwIWB6GC4b2Kn
	 OEWSQb/cisXjv+NDzmcx6uuXNdVsmOSyH1jBzLk86RwIVvV7yoI0yJMI8N5O1tLxWZ
	 sqPAibypRsiDduXZx2vz4SdLoEWaYuAYo/l7nO/C5PoaF6LQixrBB1eQNUAosrKHye
	 /gCeCfoWgbjXS3QMM1TfccoGnuhihV/zkZVDdun5Dof7x1e0ZdWeQe1z6JZskIC3qV
	 2uU8b6EJ5uv3w==
Date: Mon, 4 Nov 2024 17:48:39 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 15/18] ext4: switch to using the crc32c library
Message-ID: <20241104174839.GA1049313@google.com>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-16-ebiggers@kernel.org>
 <20241104155900.GH21832@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104155900.GH21832@frogsfrogsfrogs>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_094842_128072_8A247649 
X-CRM114-Status: GOOD (  14.96  )
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

On Mon, Nov 04, 2024 at 07:59:00AM -0800, Darrick J. Wong wrote:
> Hmm.  Looking at your git branch (which was quite helpful to link to!) I
> think for XFS we don't need to change the crc32c() calls, and the only
> porting work that needs to be done is mirroring this Kconfig change?
> And that doesn't even need to be done until someone wants to get rid of
> CONFIG_LIBCRC32C, right?

That's correct, no porting work is required now.  'select LIBCRC32C' should be
replaced with 'select CRC32', but that can be done later.

> > @@ -3278,15 +3263,11 @@ extern void ext4_group_desc_csum_set(struct super_block *sb, __u32 group,
> >  extern int ext4_register_li_request(struct super_block *sb,
> >  				    ext4_group_t first_not_zeroed);
> >  
> >  static inline int ext4_has_metadata_csum(struct super_block *sb)
> >  {
> > -	WARN_ON_ONCE(ext4_has_feature_metadata_csum(sb) &&
> > -		     !EXT4_SB(sb)->s_chksum_driver);
> > -
> > -	return ext4_has_feature_metadata_csum(sb) &&
> > -	       (EXT4_SB(sb)->s_chksum_driver != NULL);
> > +	return ext4_has_feature_metadata_csum(sb);
> >  }
> 
> Nit: Someone might want to
> s/ext4_has_metadata_csum/ext4_has_feature_metadata_csum/ here to get rid
> of the confusingly named trivial helper.
> 

Yes, that should be done as a follow-up patch.

> Otherwise this logic looks ok to me, so
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> 
> --D

Thanks,

- Eric

