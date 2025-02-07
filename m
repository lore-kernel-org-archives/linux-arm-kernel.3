Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0B9C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 21:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfD6QLs08UQ6tgrRfGMtAFxS8mlzfSYfLGRVWVB9D6o=; b=QNpzcjCqd3rzopMl0+gGcaiPfX
	e642IDTqdwAlDT2iNgJ9VeK/edTUOIE/5p5y44cp8zanJp9NnI6lq587kR21w+18H7FdiX5JarKLq
	rgPcr722E65j5j+e4LMOZq9EoIwBHzTzutiumjLjvFboBSNqLwpMFe4nJFveygaW9RNxVY+LvEkAB
	qjg4oOEeI4/E/dNj3cRY9xpmj01UGXjacFC4Miw/Y3mz9JLOPcZUL4rU0e7hcnET2NDPr7f47R7AW
	QY4N5XgiRHCEP0xTh2yhp19FWzvQm7BCFVfEanG8OqqxsBD2rebyqpSfMMZx2cvCWlIyfN2JItgsv
	Iz3Xn6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVgM-0000000BBRH-3dNK;
	Fri, 07 Feb 2025 21:14:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVez-0000000BBHF-0Gpy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 21:13:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4DFA4A43648;
	Fri,  7 Feb 2025 21:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23602C4CEE2;
	Fri,  7 Feb 2025 21:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738962791;
	bh=iLJR8r/FtzvblXPrOP6zWtxCuI9Qji2JVGmG1w2R+KI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WHiCCVLqz4V+ld3x8T62EsIheZdG9ugIWnBAn4q47Z5Rs9Wkhb5lx1qfmHlzAewPr
	 bZD19Lbcn2IoR8nQtj/Z7dqUCeQUnetD+SL7sdTqO9L8HWZIvWH8hwc+Mp37L2TFMr
	 /wUHlr+4De++G5oEzMKgUExo3ukFSs32Hp4f5nH7V6pRw92SMCRJ6W/1iSUTvO1IZq
	 jF4JYwU4r0DSHqSiyqg6tCv0I1QCPKLa4dGPcxXEsQhYJOChXn+UvRLZVP5XeoFznK
	 fP21IX/8jSoYu/UtWq7m+Q4cVxFD2fDpbkt1B7XtOYJMhe8SpuF16EIAW7aqjQc5Qx
	 YkC/gyfibE/2g==
Date: Fri, 7 Feb 2025 22:13:06 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Wilson Ding <dingwei@marvell.com>, Bjorn Helgaas <helgaas@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanghoon Lee <salee@marvell.com>
Subject: Re: [PATCH 1/1] PCI: armada8k: Add link-down handle
Message-ID: <Z6Z3YgruoFyIThE0@x1-carbon>
References: <20241112213255.GA1861331@bhelgaas>
 <AD287CCE-9FFE-49BC-B9CA-B5CED4F05AF1@linaro.org>
 <BY3PR18MB46737FB5FDBD75CF31B505B8A7EB2@BY3PR18MB4673.namprd18.prod.outlook.com>
 <BY3PR18MB4673207A36B2CD7C3B75EBA0A7EB2@BY3PR18MB4673.namprd18.prod.outlook.com>
 <20250207175759.jzmoox5mke3rachy@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207175759.jzmoox5mke3rachy@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_131313_175185_E629EDFF 
X-CRM114-Status: GOOD (  15.72  )
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

On Fri, Feb 07, 2025 at 11:27:59PM +0530, Manivannan Sadhasivam wrote:
> + Niklas (who was interested in link down handling)

I am still interested :)


> On Sat, Feb 01, 2025 at 11:05:56PM +0000, Wilson Ding wrote:
> 
> > In the meanwhile, I am quite interested the callback implementation suggested
> > by Mani. But I am sure if we have such infrastructure right there. Mani, could
> > you please elaborate a bit more, or is there any examples in the existing code
> > and patches.
> > 
> 
> There is no such implementation available right now. This idea is on my mind for
> quite some time, but never had time to do it. Maybe this gives me motivation to
> do so.
> 
> Niklas: Did you get a chance to look into this? Else, let me know. I'll take a
> stab at it.

I just remember talking to you how we would want such a callback to work,
but unfortunately I haven't had any time to look into this.

(I guess too many other things with higher prio.)

Feel free to CC me on patches, and I will do my best to test :)


Kind regards,
Niklas

