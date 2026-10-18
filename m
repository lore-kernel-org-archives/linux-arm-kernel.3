Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDE4CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 04:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtLgbDtlljO/sRjV6ua12S/D0a+0G5ormG6MSUK4Wto=; b=HGK0v3jiLsR3CGwLLg7xTZh2gX
	28BFKnOFxNh/nuQALw3tJHdv3Ca2D4A0eYbztFszg1x5Qafe9cFMVP8NazZ+ZW4r6JAiOq08TgFfc
	uV1xen7pwLk4hGvlr//WdTawxzEy/UA4oK4G+3hsSTQD33rqTBzm0w43MxXl5ZDZfyVas3vF2EkMS
	JMbqan60hB6YR/GT2jYM20XBIqhDI4IW0+LT725PEBK1TkwzJAnyZ5pbpP6fo96jDQ/qI8o4oOk/f
	09nuTsqFg5mBn9jwcpM1N1Swolf8oHCuqvoFmJfWFgQKQY2FjCQ3hagDYL3g3Y+U40s/0tA4Gjy+T
	FgYiXdGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIG1-00000005VZq-3OTk;
	Sun, 18 Oct 2026 04:12:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIFz-00000005VZh-0rPu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 04:12:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ACF7443E2D;
	Sun, 18 Oct 2026 04:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E1E1F000C4;
	Sun, 18 Oct 2026 04:12:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] PCI: iproc: Use __free(device_node) in
 iproc_pcie_msi_enable()
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, 
 Fuad Tabba <tabba@google.com>
In-Reply-To: <20260923180703.3901185-1-fuad.tabba@linux.dev>
References: <20260923180703.3901185-1-fuad.tabba@linux.dev>
Date: Sun, 18 Oct 2026 09:41:55 +0530
Message-Id: <179229671563.2114.2272123769233816365.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=H2sL6HZ9sE0wdtOfdCzEeuyadbft6hRB3ATs1YVqBwE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq1EcZK6RW9ejgLO0zl6/VgNWTO4L2u6DM/5NdR
 +m21AEPwEmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCatRHGQAKCRBVnxHm/pHO
 9cpsB/95DoVcVPw2Ij9pv78PDFwsg9nPxegf3WyFHYlmA8MMRe54BxqtNxT7auJLKs6O3B3vUft
 lZpEiRrdCAjfXR7JKiAXmzx3v84zoGgoE/VMyW1DyfjLAavo5wS2ZiV6W8ttsqiXce89RH8thEN
 W5rlPvWvAapBPtGUuNtSCKVfA4WTYPZ5j1GyZRZe+O4ROqQXNI1H42EAOHVNXCaKnibHUD2x60L
 JgLWrzjyfwYfBRrnwT3YiFxINI9ihnlaC1BjhoZHNhFFi7o/NEHVQGFXfmf+ZVcpKDRI2tUWuTa
 zw8EUyN++dIJjpcfQDGPGM6XeIVPt6/b9tRxBGgA9iqoAJyi
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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

On 2026-09-23 19:07 +0100, Fuad Tabba wrote:
> Declare msi_node with __free(device_node) and drop the out_put_node
> label and its goto: the scoped cleanup puts the MSI controller node on
> every return, as the label did.
> 
> No functional change intended.
> 
> Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Link: https://lore.kernel.org/linux-pci/61488ddc-b346-4ba3-b32a-e972a3bd75a4@mailbox.org/
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> 
> Notes:
>     Changes since v1:
>     - Declare msi_node immediately before of_msi_xlate() rather than at the
>       top of the function (Jonathan).
>     - Kept Marek's Reviewed-by, since the generated code is unchanged.
> 
>  drivers/pci/controller/pcie-iproc.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
> index afb3aa38ac6bb..bf455f2a9d9a9 100644
> --- a/drivers/pci/controller/pcie-iproc.c
> +++ b/drivers/pci/controller/pcie-iproc.c
> @@ -1338,13 +1338,13 @@ static int iproc_pcie_msi_steer(struct iproc_pcie *pcie,
>  
>  static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
>  {
> -	struct device_node *msi_node = NULL;
>  	int ret;
>  
>  	/*
>  	 * Either the "msi-parent" or the "msi-map" phandle needs to exist
>  	 * for us to obtain the MSI node.
>  	 */
> +	struct device_node *msi_node __free(device_node) = NULL;

As per cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem
the recommendation is to always define and assign variables in one
statement and not group variable definitions at the top of the
function when __free() is used."

- Mani


